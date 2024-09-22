# Dotfiles Arch Linux 2024

This repository manages dotfiles with [GNU Stow](https://www.gnu.org/software/stow/). To install, clone the repository and run:

```bash
cd dotfiles
make
```

Note that the **LightDM** configuration resides in the `/etc/lightdm` directory, so you'll need sudo access to install it. During installation, you will be prompted to enter your password. The `make` command copies the default LightDM configuration to `/etc/lightdm/defaults`.

To remove symlinks and clean up the configuration, use:

```bash
make clean
```
Cleaning up will restore the LightDM's defaults from `/etc/lightdm/defaults`.

### Window Manager: [i3](https://github.com/i3/i3)

Configuration: `i3-config`

### Terminal: [Alacritty](https://github.com/alacritty/alacritty)

Configuration: `term-config`

Kitty config also available, but not fully configured.

### dmenu: [Rofi](https://github.com/davatorium/rofi)

Launch with `$mod+d`. Learn more about Rofi [here](https://github.com/davatorium/rofi).

### Bar: [Polybar](https://github.com/polybar/polybar)
Custom theme based on the `forest` theme, with NVIDIA GPU (4090) specific modules.  
Configuration: `bar-config`

### screenshots: [flameshot](https://github.com/flameshot-org/flameshot)

launch GUI `ss-gui`

screen shot from CLI: `ss`

### file manager

This configuration has a minimal terminal file manager with [yazi](https://github.com/sxyazi/yazi)

### Login manager: [lighdm](https://github.com/canonical/lightdm)

using [lighdm-mini-greeter](https://github.com/prikhi/lightdm-mini-greeter)

### Others

window system: `x`

compositor: `picom`

font: `Inconsolata Nerd Font Mono`

walpaper manager: `nitrogen`

autojump with `j` and zoxide with `z` (still deciding which one to keep)

## Shell

Shell is managed using [oh my zsh](https://ohmyz.sh/). Plugins are: `archlinux`, `zsh-syntax-highlighting`, `zsh-autosuggestions` and `autojump`.


zsh prompt: [pure](https://github.com/sindresorhus/pure`)

## scripts and aliases

A custom bin folder is exported to `$PATH ` from `~/.config/scripts`.

### scripts

- `t` shortcuts for tmux.
- `ss` screen shots the full screen. Saves to `/home/$USER`
- `ss-gui` will launch the GUI tools for screen shots. You can crop and other edits before screen shooting.
- `caps_as_esc.sh` aliased as `cae` for caps key to function as the esc key.
- `connect-bluetooth.sh`. This is launched by `systemd` on boot to connect devices. New bluetooth devices to be added to this script.
- `clip`. clips first argument to the clipboard using `xclip`. Also aliased as `cpy`.
- `package-backup` get a package list from pacman, npm and pip, pipes the list to 3 text files and creates a new directory in `$HOME/.packages` with today's date to
  save those files.
- `tts` text-to-speech current selection. This script bound to the `mod + Shift + s` in i3.

### aliases

`a` will list only user defined aliases

      $> a
         alias shell-config="vim ~/.config/zsh/.zshrc"
         alias i3-config="vim ~/.config/i3/config"
         alias term-config="vim ~/.config/alacritty/alacritty.yml"
         alias picom-config="nvim ~/.config/picom/picom.conf"
         (...)

- `git-config` launches `gitconfig`
- `shel-config` launches `zshrc`
- `vim-config` launches vim config folder
- `src` to `source zshrc`
- `i3-config` opens `/.config/i3/config`
- `term-config` opens allacrity config file
- `bar-config` opens polybar forest theme config file
- `rofi-config` launches `/.config/rofi/config.rasi`
