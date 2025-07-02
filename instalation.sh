#!/bin/bash

set -e  # Si algo falla, termina el script

echo "🚀 Iniciando instalación de configuraciones..."

# 1. Clonar el repo si no existe aún
if [ ! -d "$HOME/dotfiles" ]; then
  echo "📥 Clonando repositorio de configuraciones..."
  git clone --recurse-submodules https://github.com/Chiguiro1/Configs.git "$HOME/dotfiles"
else
  echo "✅ Ya existe ~/dotfiles, omitiendo clonación"
fi

# 2. Crear symlinks
echo "🔗 Creando enlaces simbólicos a .config"

mkdir -p ~/.config

ln -sf "$HOME/dotfiles/hypr" ~/.config/hypr
ln -sf "$HOME/dotfiles/waybar" ~/.config/waybar
ln -sf "$HOME/dotfiles/nvim" ~/.config/nvim

# 3. Instalar dependencias mínimas
echo "📦 Instalando dependencias necesarias..."

if command -v pacman &> /dev/null; then
  sudo pacman -Sy --needed --noconfirm neovim git ripgrep fd hyprland
elif command -v apt &> /dev/null; then
  sudo apt update
  sudo apt install -y neovim git ripgrep fd-find
fi

# 4. Inicializar submódulos si es necesario
if [ -f "$HOME/dotfiles/.gitmodules" ]; then
  echo "🔁 Inicializando submódulos..."
  cd "$HOME/dotfiles"
  git submodule update --init --recursive
fi

# 5. Crear carpetas necesarias
echo "📁 Asegurando estructura de wallpapers..."
mkdir -p ~/.config/hypr/wallpapers

echo "✅ Instalación completada. Reinicia Hyprland o tu terminal para ver los cambios."

