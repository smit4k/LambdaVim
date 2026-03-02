# LambdaVim [ λ ]
A minimal, modern Neovim configuration designed for developers who want a clean and productive editing experience without the bloat. Everything is in your control. Also beginner friendly!

## Requirements
- [Neovim](https://neovim.io/) >= 0.10
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- A terminal with true color support

## Installation

Back up your existing Neovim config if you have one:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone LambdaVim:

```bash
git clone https://github.com/yourusername/lambdavim ~/.config/nvim
```

Launch Neovim and plugins will install automatically:

```bash
nvim
```

## Structure

```
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/       # Core settings, keymaps, autocmds
    └── plugins/      # Plugin specs
```
