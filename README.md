#Dotfiles

Personal configuration for my Linux setup. This repo contains my Zsh, Neovim, Ghostty, Hyprland configs etc, plus a bootstrap script to apply them on a new Linux machine.

##What is included

-Zsh
  -.zshrc with Oh My Zsh
  -functions.zsh for custom aliases and helper functions
-Terminal
  -Ghostty config
-Neovim
  -lua/config/options.lua
-Hyprland
  -input.conf, looknfeel.conf, and bindings.conf
-Waybar
  -config.jsonc, style.css, and scripts/weather.zsh
-System
  -etc/vconsole.conf for TTY keyboard layout (colemak dh btw)
-Bootstrap script
  -Creates symlinks for all configs
  -Enables key services: sshd, docker, tailscaled, syncthing, streamdeck
  -Restarts vconsole setup so the TTY layout applies immediately

##Repo structure
```
dotfiles/
├── bootstrap.sh
├── etc/
│   └── vconsole.conf
├── ghostty/
│   └── config
├── hypr/
│   ├── input.conf
│   ├── looknfeel.conf
│   └── bindings.conf
├── nvim/
│   └── lua/
│       └── config/
│           └── options.lua
├── waybar/
│   ├── config.jsonc
│   ├── style.css
│   └── scripts/
│       └── weather.zsh
└── zsh/
    ├── .zshrc
    └── functions.zsh
```
## Bootstrap

Clone the repo and run the bootstrap script.

```bash
git clone https://github.com/limitedink/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

This will:
- Create symlinks for configs: Zsh, Neovim, Ghostty, Hyprland
- Enable system services: sshd, docker, tailscaled
- Enable user services: syncthing, streamdeck
- Apply the TTY keyboard layout via vconsole.conf

## Notes

- Private secrets and API keys live in ~/.zshrc.local which is not tracked
- Repo is designed for Linux (Omarchy/Arch), not macOS/WSL
- You can rerun bootstrap.sh any time after changing configs
