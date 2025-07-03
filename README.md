# Configs 

Este repositorio contiene mi entorno completo de configuración para Linux —principalmente basado en Arch— incluyendo:

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Waybar](https://github.com/Alexays/Waybar)
- [Neovim](https://neovim.io/)
- [Zsh](https://www.zsh.org/)
- Wallpapers y más...

> ⚠️ Este entorno está pensado para usarse con [Hyprland](https://hyprland.org) y Wayland.

---

##  Requisitos

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
```
---

## ⚙️ Instalación

1. Abre una terminal
2. Clona este repositorio con submódulos y ejecuta el script:

```bash
git clone --recurse-submodules https://github.com/Chiguiro1/Configs.git ~/dotfiles
cd ~/dotfiles
chmod +x instalation.sh
./instalation.sh
```
---

## 🔧 ¿Qué hace el script?

El archivo `instalation.sh` realiza lo siguiente:

- Crea enlaces simbólicos desde `~/dotfiles` a `~/.config`
- Instala y configura **Oh My Zsh**
- Instala el tema **Powerlevel10k**
- Instala plugins útiles: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Instala la fuente **MesloLGS Nerd Font** para íconos en terminal
- Cambia tu shell por defecto a Zsh
- Asegura que Neovim y Lazy funcionen correctamente

---

## 🖥️ Personalización

- Ejecuta `p10k configure` para personalizar el prompt de Zsh
- Modifica los módulos de Waybar en `waybar/config.jsonc`
- Cambia el fondo desde `hypr/hyprpaper.conf`
- Agrega tus comandos de inicio en `hypr/autostart.conf`

---

## 🧱 Herramientas utilizadas

| Herramienta               | Descripción                                |
|---------------------------|--------------------------------------------|
| Hyprland                  | Compositor dinámico para Wayland           |
| Waybar                    | Barra de estado altamente personalizable   |
| Neovim + Lazy             | Editor moderno y extensible                |
| Zsh + Powerlevel10k       | Shell moderno y temazo visual              |
| Kitty                     | Emulador de terminal rápido y elegante     |
| zsh-autosuggestions       | Sugerencias automáticas al escribir        |
| zsh-syntax-highlighting   | Coloreado de comandos por sintaxis         |
| eza, bat, fzf, ripgrep    | Reemplazos modernos para ls, cat, etc.     |

---

##  Tips

- Si Hyprland crashea por "Too many levels of symbolic links", borra el archivo que cause el bucle con `rm` y vuelve a enlazarlo correctamente.
- Si `zsh-autosuggestions` o `zsh-syntax-highlighting` no funcionan, revisa que existan en `~/.oh-my-zsh/custom/plugins/`.
- Usa `wpctl get-volume @DEFAULT_AUDIO_SINK@` para verificar si tu sistema inicia en silencio.
- Usa `pavucontrol` si prefieres una interfaz gráfica para el audio.

---

##  Fonts recomendadas

Asegúrate de tener instalada alguna **Nerd Font**, como [MesloLGS NF](https://github.com/romkatv/powerlevel10k#manual-font-installation):

```bash
paru -S nerd-fonts

También puedes instalarla manualmente copiando .ttf en ~/.local/share/fonts/ y actualizando caché con:

fc-cache -fv

 Terminal recomendada

    Kitty por su velocidad y soporte de gráficos GPU

    Puedes modificarlo desde kitty/kitty.conf
```

# Autor

# @Chiguiro1

Este entorno fue creado por y para un uso personal, pero puedes adaptarlo a tu flujo fácilmente.

-- Nota    

Este repo está en constante evolución. Si encuentras errores o tienes sugerencias, siéntete libre de abrir un issue o un PR.

