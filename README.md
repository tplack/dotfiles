# Tyler's dotfiles

The shell, Git, Vim, tmux, and prompt configuration currently used on my Mac.

## Install

```bash
git clone https://github.com/tplack/dotfiles.git ~/dotfiles
cd ~/dotfiles
source bootstrap.sh
```

The repository contains shared configuration only. Keep API keys, credentials,
mail configuration, command histories, and machine-specific secrets in local-only
files such as `~/.extra`, `~/.netrc`, and `~/.mbsyncrc`.
