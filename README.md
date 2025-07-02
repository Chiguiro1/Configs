## Configs 

Este repositorio contiene mi entorno completo de configuración para Linux —principalmente basado en Arch— incluyendo:

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Waybar](https://github.com/Alexays/Waybar)
- [Neovim](https://neovim.io/)
- [Zsh](https://www.zsh.org/)
- Wallpapers y más...

> ⚠️ Este entorno está pensado para usarse con [Hyprland](https://hyprland.org) y Wayland.

---

## 📦 Requisitos

Antes de instalar, asegúrate de tener:

- Linux (Arch Linux o derivado recomendado)
- Git
- Zsh
- Neovim
- `ripgrep` (`rg`)
- `fd` (`fd-find` en Debian/Ubuntu)

---

## Estructura

```bash
dotfiles/
├── hypr/             → Configuración de Hyprland
├── waybar/           → Configuración de Waybar
├── nvim/             → Neovim + Lazy + plugins
│   ├── init.lua
│   └── lua/
├── zsh/              → Configuración de Zsh (.zshrc, .zshenv)
├── wallpapers/       → Fondos usados por Hyprpaper
├── instalation.sh    → Script de instalación automática
└── .gitmodules       → Submódulos como lazy.nvim

---

## ⚙️ Instalación

1. Abre una terminal
2. Clona este repositorio con submódulos y ejecuta el script:

```bash
git clone --recurse-submodules https://github.com/Chiguiro1/Configs.git ~/dotfiles
cd ~/dotfiles
chmod +x instalation.sh
./instalation.sh

