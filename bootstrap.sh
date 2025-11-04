#!/usr/bin/env bash
set -euo pipefail

echo "===> Setting up dotfiles"

# --- Symlinks ---
echo "Linking dotfiles..."
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# Ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

# Nvim
ln -sf ~/dotfiles/nvim/lua/config/options.lua ~/.config/nvim/lua/config/options.lua 

# Hyprland
ln -sf ~/dotfiles/hypr/bindings.conf ~/.config/hypr/bindings.conf
ln -sf ~/dotfiles/hypr/looknfeel.conf ~/.config/hypr/looknfeel.conf
ln -sf ~/dotfiles/hypr/input.conf ~/.config/hypr/input.conf

# Waybar
ln -sf ~/dotfiles/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/dotfiles/waybar/style.css ~/.config/waybar/style.css
ln -sf ~/dotfiles/waybar/scripts/weather.zsh ~/.config/waybar/scripts/weather.zsh


sudo ln -sf ~/dotfiles/etc/vconsole.conf /etc/vconsole.conf



echo "Symlinks complete."

# --- Services (system) ---
echo "Enabling system services..."
sudo systemctl enable --now sshd.service
sudo systemctl enable --now docker.service
sudo systemctl enable --now tailscaled.service

# --- Services (user) ---
echo "Enabling user services..."
systemctl --user enable --now syncthing.service
systemctl --user enable --now streamdeck.service
echo "Services enabled."

# --- Reload vconsole (TTY keyboard layout) ---
if systemctl list-unit-files | grep -q systemd-vconsole-setup.service; then
  echo "===> Restarting vconsole to apply TTY keyboard layout"
  sudo systemctl restart systemd-vconsole-setup.service
fi

echo "===> Dotfiles bootstrap complete!"

