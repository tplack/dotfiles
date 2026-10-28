# Interactive conveniences; sourced at the end of .zshrc.
[[ -o interactive ]] || return
source "$HOME/.config/shell/zoxide.zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Search sessions by name, current directory, or command.
ts() { "$HOME/.local/bin/tmux-pick"; }

# Cache the Python version when directory or environment changes.
_shell_python_context() {
  local cache_key="$PWD|${VIRTUAL_ENV:-}|$PATH"
  [[ ${_shell_python_cache_key:-} == "$cache_key" ]] && return
  typeset -g _shell_python_cache_key="$cache_key" _shell_python_version=''
  [[ -n ${VIRTUAL_ENV:-} ]] && return
  local dir=$PWD version
  while true; do
    if [[ -f $dir/pyproject.toml || -f $dir/requirements.txt || -f $dir/Pipfile || -f $dir/setup.py || -f $dir/.python-version ]]; then
      version=$(command python3 --version 2>/dev/null) || return
      [[ $version == 'Python '[0-9]* ]] && typeset -g _shell_python_version=${version#Python }
      return
    fi
    [[ $dir == / ]] && return
    dir=${dir:h}
  done
}
prompt_python_project() {
  [[ -n $_shell_python_version ]] || return
  p10k segment -f 151 -t "Python ${_shell_python_version//\%/%%}"
}

# Notify only after commands lasting at least 30 seconds. No command text is sent.
zmodload zsh/datetime
autoload -Uz add-zsh-hook
_shell_command_timer() { typeset -g _shell_command_started=$EPOCHSECONDS; }
_shell_command_notify() {
  local exit_code=$? elapsed
  [[ -n ${_shell_command_started:-} ]] || return
  elapsed=$(( EPOCHSECONDS - _shell_command_started ))
  unset _shell_command_started
  (( elapsed >= ${SHELL_NOTIFY_AFTER:-30} )) || return
  local message="Command finished in ${elapsed}s (exit ${exit_code})"
  if [[ -n ${TMUX:-} ]]; then
    command tmux display-message -d 6000 "$message"
    printf '\a'
  elif [[ ${TERM_PROGRAM:-} == iTerm.app ]]; then
    printf '\e]9;%s\a' "$message"
  fi
}
add-zsh-hook precmd _shell_python_context
add-zsh-hook preexec _shell_command_timer
# Run first to capture the command exit code before other prompt hooks.
add-zsh-hook -d precmd _shell_command_notify
precmd_functions=(_shell_command_notify ${precmd_functions:#_shell_command_notify})

# Load last so highlighting sees every custom editing widget.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
