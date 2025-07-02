#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Iniciando instalación de Configs..."

REPO="https://github.com/Chiguiro1/Configs.git"
DOT="$HOME/dotfiles"
ZDOT="$HOME/.config/zsh"

# 1️⃣ Clonar o actualizar repo
if [[ ! -d "$DOT" ]]; then
  git clone --recurse-submodules "$REPO" "$DOT"
else
  echo "✅ ~/dotfiles ya existe, actualizando..."
  cd "$DOT"
  git pull
  git submodule update --init --recursive
  cd -
fi

# 2️⃣ Symlinks de configuraciones
echo "🔗 Creando symlinks..."
mkdir -p ~/.config
ln -sfn "$DOT/hypr" ~/.config/hypr
ln -sfn "$DOT/waybar" ~/.config/waybar
ln -sfn "$DOT/nvim" ~/.config/nvim

# ✳️ Zsh: mover configuración a XDG y enlazar .zshrc
echo "🐚 Configurando Zsh..."
mkdir -p "$ZDOT"
ln -sfn "$DOT/zsh/.zshrc" "$ZDOT/.zshrc"
ln -sfn "$DOT/zsh/.zshenv" "$ZDOT/.zshenv" || true
# Symlink wrapper en $HOME si no existe
[ ! -L ~/.zshrc ] && ln -sfn "$ZDOT/.zshrc" ~/.zshrc

# 3️⃣ Instalar dependencias mínimas
echo "📦 Instalando dependencias..."
if command -v pacman &>/dev/null; then
  sudo pacman -Sy --needed --noconfirm neovim git ripgrep fd hyprland zsh
elif command -v apt &>/dev/null; then
  sudo apt update
  sudo apt install -y neovim git ripgrep fd-find zsh
else
  echo "⚠️ No se detectó pacman ni apt. Revisa la instalación manualmente."
fi

# 4️⃣ Inicializar submódulos si existen
if [[ -f "$DOT/.gitmodules" ]]; then
  echo "🔁 Inicializando submódulos..."
  cd "$DOT"
  git submodule update --init --recursive
  cd -
fi

# 5️⃣ Cambiar shell por defecto a Zsh
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "🔄 Cambiando shell por defecto a Zsh..."
  chsh -s "$(which zsh)"
fi

echo ""
echo "✅ Instalación finalizada."
echo "Instrucciones:"
echo "  • Reinicia tu terminal o inicia Zsh manualmente con 'zsh'"
echo "  • En Neovim, ejecuta ':Lazy sync' para instalar plugins"
echo "  • Si ves errores, revisa que tus rutas y permisos sean correctos"

