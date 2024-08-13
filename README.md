# Neovim setup

Custom Neovim setup configured using Lazy package manager

## System dependencies

Important system dependencies:

- **Nerd fonts** ([information source](https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0)):
    - Download a [Nerd Font](https://www.nerdfonts.com/) (good choice is "JetBrainsMono Nerd Font").
    - Unzip and copy to '~/.local/share/fonts'.
    - Run the command `fc-cache -fv` to manually rebuild the font cache.

- **Tools for finding stuff**:
    - [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

## Installation

Delete old nvim configuration
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

Clone the repository to ~/.config
```bash
git clone --filter=blob:none https://github.com/amanhex/nvim.git ~/.config/nvim
```

Run neovim to complete the setup
```bash
nvim
```

## Key Mappings

- Leader key: " " (Space)

| Keys       | Mode          | Description                 |
| ---------- | ------------- | --------------------------- |
| ;          | Normal        | Command mode                |
| leader+q   | Normal        | Quit Neovim                 |
| leader+w   | Normal        | Save current file           |
| leader+ff  | Normal        | Find files using Telescope  |
| leader+fg  | Normal        | Live grep using Telescope   |
| leader+fb  | Normal        | Open Telescope file browser |
| leader+e   | Normal        | Toggle Nvim Tree            |
| leader+E   | Normal        | Focus Nvim Tree             |
| leader+1   | Normal        | Open first terminal         |
| leader+2   | Normal        | Open second terminal        |
| ctrl+|     | Normal/Insert | Toggle terminal             |
| leader+/   | Normal/Visual | Toggle comments             |
| jk         | Insert        | Exit insert mode            |
| leader+vs  | Normal        | Vertical Split              |
| leader+hs  | Normal        | Horizontal Split            |
| Tab        | Normal        | Cycle forward buffers       |
| S-Tab      | Normal        | Cycle backward buffers      |
| leader+x   | Normal        | Close current buffer        |

## Additional Configuration 

- **Plugins**: New plugins can be installed in `plugin.lua` and the configuration for the plugin should be put in `lua\plugins\`. Finally the configuration should be required in `init.lua`.

- **Theme**: The configuration uses `arctic.nvim` as the color scheme. Install new color scheme in `plugin.lua` and update `theme.lua`.

- **Dashboard**: Update the dashboard by editing `lua\plugins\dashboard.lua`

- **Transparency**: Nvim can be turned transparent using `:TransparentEnable` command. Transparency persists for the sessions.

## Screenshots


![1](https://github.com/user-attachments/assets/f63054ab-0863-45e3-98fb-d7d6163c5b76)

![2](https://github.com/user-attachments/assets/422a729d-052a-491a-b7f5-15bc404117e1)

![3](https://github.com/user-attachments/assets/060c509b-87a2-4353-bd40-ee76ed0f7fff)

![4](https://github.com/user-attachments/assets/7abed877-261b-45b6-96bb-650d73cb489f)

