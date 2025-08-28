# Configs 

Este repositorio contiene mi entorno completo de configuración para Linux —principalmente basado en Arch— incluyendo:

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Waybar](https://github.com/Alexays/Waybar)
- [Neovim](https://neovim.io/)
- [Zsh](https://www.zsh.org/)
- Wallpapers y más...

---

##  Requisitos

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

## Instalación

1. Abra una terminal
2. Clone este repositorio con submódulos y ejecuta el script:

```bash
git clone --recurse-submodules https://github.com/Chiguiro1/Configs.git ~/dotfiles
cd ~/dotfiles
chmod +x instalation.sh
./instalation.sh
```
---

##  ¿Qué hace el script?

El archivo `instalation.sh` realiza lo siguiente:

- Cree enlaces simbólicos desde `~/dotfiles` a `~/.config`
- Instale y configura **Oh My Zsh**
- Instale el tema **Powerlevel10k**
- Instale plugins útiles: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Instale la fuente **MesloLGS Nerd Font** para íconos en terminal
- Cambie su shell por defecto a Zsh
- Asegure que Neovim y Lazy funcionen correctamente

---

##  Personalización

- Ejecute `p10k configure` para personalizar el prompt de Zsh
- Modifique los módulos de Waybar en `waybar/config.jsonc`
- Cambie el fondo desde `hypr/hyprpaper.conf`
- Agrege sus comandos de inicio en `hypr/autostart.conf`

---

##  Herramientas utilizadas

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
- Si `zsh-autosuggestions` o `zsh-syntax-highlighting` no funcionan, revise que existan en `~/.oh-my-zsh/custom/plugins/`.
- Use `wpctl get-volume @DEFAULT_AUDIO_SINK@` para verificar si su sistema inicia en silencio.
- Use `pavucontrol` si prefiere una interfaz gráfica para el audio.

---

##  Fonts recomendadas

Verifique de tener instalada alguna **Nerd Font**, como [MesloLGS NF](https://github.com/romkatv/powerlevel10k#manual-font-installation):

```bash
paru -S nerd-fonts

También puede instalarla manualmente copiando .ttf en ~/.local/share/fonts/ y actualizando caché con:

fc-cache -fv

 Terminal recomendada

    Kitty por su velocidad y soporte de gráficos GPU

    Puede modificarlo desde kitty/kitty.conf
```

# Autor

# @Chiguiro1

Este entorno fue creado por y para un uso personal, pero puede adaptarlo a su flujo fácilmente.


