# Tyler's dotfiles

Personal shell, Git, Vim, tmux, and macOS configuration files.

## Install

Clone the repository and run the bootstrap script:

```bash
git clone https://github.com/tplack/dotfiles.git ~/dotfiles
cd ~/dotfiles
source bootstrap.sh
```

The script asks before copying files into `~`. Use `source bootstrap.sh --force` to skip the prompt.

## Local-only settings

Keep secrets, API keys, machine-specific paths, and account-specific configuration in `~/.extra` or `~/.zshrc`. Those files are intentionally not part of this public repository.

## Homebrew

`brew.sh` contains the command-line tools I commonly install on a new Mac. Review it before running:

```bash
./brew.sh
```

## License

The original template components retain their MIT license in [LICENSE-MIT.txt](LICENSE-MIT.txt).
