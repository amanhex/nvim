# Neovim setup

A personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim), with LSP, treesitter, fuzzy finding, completion, git integration and a dashboard.

## Features

- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Theme**: [no-clown-fiesta](https://github.com/aktersnurra/no-clown-fiesta.nvim)
- **LSP**: `mason.nvim` + `mason-lspconfig.nvim` + `lsp-zero` (clangd, pyright, eslint, html, cssls, tailwindcss, qmlls)
- **Completion**: `nvim-cmp` + `LuaSnip` + `nvim-autopairs`
- **Syntax**: `nvim-treesitter`
- **Fuzzy finder**: `telescope.nvim` with the file browser extension
- **File tree**: `nvim-tree.lua`
- **UI**: `lualine`, `nvim-cokeline`, `dashboard-nvim`, `indent-blankline`
- **Git**: `gitsigns.nvim`
- **Other**: `toggleterm.nvim` (floating terminals), `nvim-colorizer`, `nvim-comment`, `transparent.nvim`, `journal.nvim`, `conform.nvim` (format on save)

## Requirements

- **Neovim 0.11 or newer** (the config uses `vim.lsp.config` and `vim.uv`)
- **git**
- **A Nerd Font** — install [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) or another Nerd Font:

  ```bash
  mkdir -p ~/.local/share/fonts
  # copy the unzipped .ttf files into ~/.local/share/fonts
  fc-cache -fv
  ```

- **[ripgrep](https://github.com/BurntSushi/ripgrep#installation)** — used by Telescope live grep
- **Node.js and npm** — required by `pyright` and `eslint`
- **A C compiler and `make`** — needed to build treesitter parsers (usually `build-essential` / `base-devel`)
- **A clipboard tool** — the config uses `clipboard=unnamedplus`, so install `wl-clipboard` (Wayland) or `xclip` (X11)
- **Optional**: `stylua` for Lua formatting on save (`lua/plugins` uses it via `conform.nvim`)

Verify the basics:

```bash
nvim --version        # >= 0.11
git --version
rg --version
node --version
```

## Installation

Back up any existing configuration first:

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
```

Clone the repository:

```bash
git clone --filter=blob:none https://github.com/amanhex/nvim.git ~/.config/nvim
```

Launch Neovim:

```bash
nvim
```

`lazy.nvim` bootstraps itself and installs the plugins on first start. Then:

- `:Lazy sync` — install/update all plugins
- `:Mason` — check or install the language servers (and press `I` on any missing package)
- `:TSUpdate` — build/update the treesitter parsers

Restart Neovim once everything has finished installing.

## Uninstallation

Back up anything you want to keep, then remove the config and its runtime data:

```bash
# configuration
rm -rf ~/.config/nvim

# plugins, mason packages, treesitter parsers
rm -rf ~/.local/share/nvim

# undo history, shada, logs
rm -rf ~/.local/state/nvim

# lazy.nvim cache
rm -rf ~/.cache/nvim
```

To restore a previous setup instead of starting clean:

```bash
mv ~/.config/nvim.bak ~/.config/nvim
mv ~/.local/share/nvim.bak ~/.local/share/nvim
mv ~/.local/state/nvim.bak ~/.local/state/nvim
```

## Structure

```
init.lua              -- entry point; requires everything below
lua/
  core/
    config.lua        -- editor options and leader key
    plugin.lua        -- lazy.nvim setup and plugin list
    theme.lua         -- colorscheme
    keymaps.lua       -- global key mappings
  plugins/            -- per-plugin configuration
    cmp.lua
    lsp.lua
    treesitter.lua
    ...
```

- **Adding a plugin**: add it to `lua/core/plugin.lua`, put its configuration in a new file under `lua/plugins/`, then require that file in `init.lua`.
- **Changing the theme**: install the colorscheme in `lua/core/plugin.lua` and update `lua/core/theme.lua`.
- **Dashboard**: edit `lua/plugins/dashboard.lua`.
- **LSP servers**: edit `ensure_installed` in `lua/plugins/lsp.lua`, then run `:Mason`.

## Key mappings

Leader key is **Space**.

### General

| Keys      | Mode           | Action                      |
| --------- | -------------- | --------------------------- |
| `;`       | Normal         | Enter command mode          |
| `jk`      | Insert         | Exit insert mode            |
| `<leader>q` | Normal       | Quit Neovim                 |
| `<leader>w` | Normal       | Save file                   |

### Files and search

| Keys        | Mode   | Action                        |
| ----------- | ------ | ----------------------------- |
| `<leader>ff` | Normal | Find files (Telescope)        |
| `<leader>fg` | Normal | Live grep (Telescope)         |
| `<leader>fb` | Normal | Telescope file browser        |
| `<leader>e`  | Normal | Toggle NvimTree               |
| `<leader>E`  | Normal | Focus NvimTree                |

### Buffers

| Keys      | Mode   | Action                  |
| --------- | ------ | ----------------------- |
| `<Tab>`   | Normal | Next buffer             |
| `<S-Tab>` | Normal | Previous buffer         |
| `<leader>x` | Normal | Close current buffer  |

### Splits and windows

| Keys        | Mode   | Action              |
| ----------- | ------ | ------------------- |
| `<leader>vs` | Normal | Vertical split      |
| `<leader>hs` | Normal | Horizontal split    |
| `<C-h>`     | Normal | Move to left window |
| `<C-j>`     | Normal | Move to lower window |
| `<C-k>`     | Normal | Move to upper window |
| `<C-l>`     | Normal | Move to right window |

### Terminals and comments

| Keys      | Mode           | Action                    |
| --------- | -------------- | ------------------------- |
| `<C-\>`   | Normal/Insert  | Toggle floating terminal  |
| `<leader>1` | Normal       | Toggle terminal 1         |
| `<leader>2` | Normal       | Toggle terminal 2         |
| `<leader>/` | Normal/Visual | Toggle comment            |

### LSP (active per buffer)

| Keys   | Action                        |
| ------ | ----------------------------- |
| `K`    | Hover documentation           |
| `gs`   | Signature help                |
| `gd`   | Go to definition              |
| `gD`   | Go to declaration             |
| `gi`   | Go to implementation          |
| `go`   | Go to type definition         |
| `gr`   | Find references               |
| `F2`   | Rename symbol                 |
| `F4`   | Code action                   |

Neovim's built-in LSP mappings (`grn` rename, `gra` code action, `grr` references, `gri` implementation, `grt` type definition, `grx` codelens) are also available.

## Formatting

`conform.nvim` formats on save. Lua uses `stylua`; filetypes without a configured formatter fall back to LSP formatting. `stylua` is **not** installed automatically — install it with your package manager or `cargo install stylua`:

```bash
cargo install stylua
# or
sudo pacman -S stylua
```

## Transparency

Toggle transparency at runtime:

```vim
:TransparentEnable
:TransparentDisable
:TransparentToggle
```

## Notes

- `nvim-treesitter` is pinned to the archived `master` branch. It works, but eventually needs migrating to the `main` branch.
- Mason installs language servers into `~/.local/share/nvim/mason`, not system-wide.
- Run `:checkhealth` to diagnose missing tools, clipboard support or LSP problems.

## Screenshots

![1](https://github.com/user-attachments/assets/f63054ab-0863-45e3-98fb-d7d6163c5b76)

![2](https://github.com/user-attachments/assets/422a729d-052a-491a-b7f5-15bc404117e1)

![3](https://github.com/user-attachments/assets/060c509b-87a2-4353-bd40-ee76ed0f7fff)

![4](https://github.com/user-attachments/assets/7abed877-261b-45b6-96bb-650d73cb489f)
