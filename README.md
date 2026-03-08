# 🌙 My Neovim Config.

A personalized Neovim setup focused on **Full-stack Development** (TypeScript, Lua, Python). Powered by `lazy.nvim`.

## 🚀 Features
* 📦 **Manage and install plugins** [lazy.nvim](https://github.com/folke/lazy.nvim)
* 🔭 **Fuzzy find files and text** [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* ⚡ **Boost search speed with FZF** [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
* 🌳 **High-performance syntax highlighting** [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* 🎨 **Apply a soothing pastel theme** [catppuccin](https://github.com/catppuccin/nvim)
* 📊 **Display a sleek status line** [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* 🌈 **Preview hex colors in real-time** [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
* 📑 **Manage Git directly from the editor** [vim-fugitive](https://github.com/tpope/vim-fugitive)
* 📋 **Copy text to system clipboard over SSH** [vim-oscyank](https://github.com/ojroques/vim-oscyank)
* ✨ **Add file type icons** [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## 🛠️ Requirements
Before installing, ensure you have the following on your system:
* **Neovim (v0.9.0+)**
* **Ripgrep**: Required for Telescope `live_grep` [Download Here](https://github.com/BurntSushi/ripgrep).
* **A C Compiler**: (gcc/clang/zig) Required for Treesitter parsers.
* **Nerd Fonts**: Recommended for icons (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)).

## ⌨️ Keybindings

| Action |    Deps     | Shortcut |
|:---|:---:|---:|
| Telescope Find Files |    N/A     | Space ff |
| Telescope Live Grep |   [Ripgrep](https://github.com/BurntSushi/ripgrep)      | Space fg |
| Telescope Buffers |   N/A      | Space fb |
| Telescope Help Tags|   N/A     | Space fh |
