codex() {
  cd ~/Downloads || return
  if [ -z "$TMUX" ]; then
    tmux new-session -c ~/Downloads "command codex $*"
  else
    command codex "$@"
  fi
}


# Subscription-aware Claude launcher (account 2 preferred).
claude() {
  cd "$HOME/Downloads" || return
  local -a launch_args
  launch_args=("$HOME/.local/bin/claude-watchdog" run --dangerously-skip-permissions "$@")
  if [[ -z "$TMUX" ]]; then
    local launch_cmd
    printf -v launch_cmd '%q ' "${launch_args[@]}"
    tmux new-session -c "$HOME/Downloads" "$launch_cmd"
  else
    command "${launch_args[@]}"
  fi
}
claude2() {
  cd "$HOME/Downloads" || return
  "$HOME/.local/bin/claude-watchdog" account2 --dangerously-skip-permissions "$@"
}

# Third Claude account: separate login, settings, and session history.
claude3() {
  cd "$HOME/Downloads" || return
  local -a claude3_args
  claude3_args=(env -u ANTHROPIC_API_KEY -u ANTHROPIC_AUTH_TOKEN
    -u CLAUDE_CODE_OAUTH_TOKEN "CLAUDE_CONFIG_DIR=$HOME/.claude-account3"
    claude --dangerously-skip-permissions "$@")
  if [ -z "$TMUX" ]; then
    local claude3_cmd
    printf -v claude3_cmd '%q ' "${claude3_args[@]}"
    tmux new-session -c "$HOME/Downloads" "$claude3_cmd"
  else
    command "${claude3_args[@]}"
  fi
}

alias vim='nvim'
alias vi='nvim'

export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/opt/glib/lib:${DYLD_FALLBACK_LIBRARY_PATH}"


alias python='python3'
alias dotfiles='git --git-dir=$HOME/.dotfiles-repo --work-tree=$HOME'
alias runserver='python3 manage.py runserver_plus --cert-file 127.0.0.1+2.pem --key-file 127.0.0.1+2-key.pem'

export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:${DYLD_FALLBACK_LIBRARY_PATH}"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/tylerplack/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"

# Added by Antigravity
export PATH="/Users/tylerplack/.antigravity/antigravity/bin:$PATH"
export REQUESTS_CA_BUNDLE=$(python3 -c "import certifi; print(certifi.where())")
export SSL_CERT_FILE=$(python3 -c "import certifi; print(certifi.where())")
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# WeasyPrint library path
export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib"

# LaTeX build alias
alias ltx="$HOME/dev/tplack/LaTeX/build.sh"

# >>> BridgeSpace shell integration >>>
# BridgeSpace emits OSC 133 semantic prompt markers so its AI inline
# autocomplete can tell when you are typing vs when a command is
# running. Safe to delete this block — it only adds precmd/preexec
# hooks. Unset BRIDGESPACE_SHELL_INTEGRATION to disable at runtime.
if [[ -o interactive && "${BRIDGESPACE_SHELL_INTEGRATION:-1}" != "0" ]]; then
  __bridgespace_prompt_start() { printf '\e]133;A\a'; }
  __bridgespace_command_start() { printf '\e]133;C\a'; }
  autoload -Uz add-zsh-hook 2>/dev/null
  if (( ${+functions[add-zsh-hook]} )); then
    add-zsh-hook precmd __bridgespace_prompt_start 2>/dev/null
    add-zsh-hook preexec __bridgespace_command_start 2>/dev/null
  fi
fi
# <<< BridgeSpace shell integration <<<

# Run opencode inside a tmux session. If already inside tmux, run it
# directly to avoid nesting. Otherwise attach to (or create) a dedicated
# "opencode" session so it always lives in tmux.
opencode() {
  if [[ -n "$TMUX" ]]; then
    command opencode "$@"
  elif tmux has-session -t opencode 2>/dev/null; then
    tmux attach-session -t opencode
  else
    tmux new-session -s opencode "command opencode ${(j: :)${(q)@}}"
  fi
}

# RiverTerminal (TUI financial terminal)
alias riveterminal="/Users/tylerplack/dev/tplack/riveterminal/venv/bin/riveterminal"

# cd shortcuts: with cdable_vars, `cd <var>` jumps to the directory the
# variable points at (only when no real dir of that name exists in cwd)
setopt cdable_vars
dc="$HOME/dev/south-river-mtg/demand-conversions"
rp="$HOME/dev/reversepilot/dc_los_django"

alias p="python3"

# >>> command start/finish timestamps >>>
# Prints "started at HH:MM:SS" when a command begins. The finish time is the
# clock on the next prompt line (p10k's `time` segment), alongside "took Ns".
# Requires POWERLEVEL9K_TRANSIENT_PROMPT=off in ~/.p10k.zsh so old lines keep their clock.
__cmd_start_stamp() { print -P "%F{248}  ▶ started at $(date '+%I:%M:%S %p')%f"; }
autoload -Uz add-zsh-hook && add-zsh-hook preexec __cmd_start_stamp
# <<< command start/finish timestamps <<<

# >>> useful shell controls >>>
# Type a prefix, then Up/Down to find matching commands in history.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
for _shell_keymap in emacs viins; do
  bindkey -M "$_shell_keymap" '^[[A' up-line-or-beginning-search
  bindkey -M "$_shell_keymap" '^[[B' down-line-or-beginning-search
  bindkey -M "$_shell_keymap" '^[OA' up-line-or-beginning-search
  bindkey -M "$_shell_keymap" '^[OB' down-line-or-beginning-search
done
unset _shell_keymap
setopt HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
# Locally installed fzf: Ctrl-R history, Ctrl-T files, Alt-C directories.
if [[ -r /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  export FZF_DEFAULT_OPTS='--height=45% --layout=reverse --border=rounded --color=fg:252,bg:236,hl:117,fg+:255,bg+:239,hl+:141,pointer:117,marker:141,spinner:117,header:103'
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
alias ll='ls -lahG'
alias shellreload='source ~/.zshrc'
# <<< useful shell controls <<<

# Suggestions, project data, directory jumps, and long-command alerts.
source "$HOME/.config/shell/enhancements.zsh"

# Raise per-shell open-file limit (launchd default is 256)
ulimit -n 65536 2>/dev/null

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<

# Gather windows from every other tmux session into the active session.
tmux-gather() {
  local target_session session window_index

  if [ -n "$TMUX" ]; then
    target_session=$(tmux display-message -p '#{session_name}') || return 1
  else
    target_session=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | head -n 1)
    if [ -z "$target_session" ]; then
      target_session=main
      tmux new-session -d -s "$target_session" || return 1
    fi
  fi

  tmux list-windows -a -F '#{session_name} #{window_index}' |
    while read -r session window_index; do
      if [ "$session" != "$target_session" ]; then
        tmux move-window -s "$session:$window_index" -t "$target_session:" 2>/dev/null || true
      fi
    done

  if [ -z "$TMUX" ]; then
    tmux attach-session -t "$target_session"
  fi
}
