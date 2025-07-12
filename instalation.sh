#!/bin/bash

echo " Instalando entorno de configuración..."

# Ruta base
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# instalando paquetes necesarios
echo " Instalando paquetes necesarios..."
sudo pacman -S --needed eza bat ripgrep fd fzf neovim zsh git curl

# Crear .config si no existe
mkdir -p "$CONFIG_DIR"

# -----------------------------
# 1. Enlaces simbólicos
# -----------------------------
echo " Enlazando configuraciones..."
ln -sf "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"
ln -sf "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
ln -sf "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
ln -sf "$DOTFILES_DIR/zsh" "$CONFIG_DIR/zsh"
ln -sf "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"

# -----------------------------
# 2. Zsh y plugins
# -----------------------------
echo " Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo " Instalando plugins de Zsh..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# -----------------------------
# 3. Powerlevel10k
# -----------------------------
echo " Instalando Powerlevel10k..."
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# -----------------------------
# 4. Fuente Nerd Font (MesloLGS)
# -----------------------------
echo " Instalando fuente MesloLGS Nerd Font..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts || exit
curl -fLo "MesloLGS NF Regular.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Regular/MesloLGS%20NF%20Regular.ttf
curl -fLo "MesloLGS NF Bold.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Bold/MesloLGS%20NF%20Bold.ttf
curl -fLo "MesloLGS NF Italic.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Italic/MesloLGS%20NF%20Italic.ttf
curl -fLo "MesloLGS NF Bold Italic.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/L/Bold-Italic/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -fv

# -----------------------------
# 5. Zsh por defecto
# -----------------------------
echo "⚙️ Cambiando shell por defecto a Zsh..."
chsh -s "$(which zsh)"

# -----------------------------
# 6. Neovim: Lazy.nvim
# -----------------------------
echo " Verificando Lazy.nvim en Neovim..."
if [ ! -d "$DOTFILES_DIR/nvim/lazy/lazy.nvim" ]; then
  git clone https://github.com/folke/lazy.nvim.git "$DOTFILES_DIR/nvim/lazy/lazy.nvim"
fi

# -----------------------------
# 7. Mensaje final
# -----------------------------
echo -e "\n✅ Instalación completa. Reinicia la sesión para aplicar todos los cambios."
echo "Ejecuta 'p10k configure' para personalizar el prompt de Zsh."

