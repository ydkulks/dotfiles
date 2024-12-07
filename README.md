# Dotfiles
You're dotfiles are how you personalize you're system.These are mine.I recommend
that you DO NOT simply copy my scripts, but learn what they do.

Dotfiles are meant to be grown organically with you're experience. You can fork
my dotfiles and play-around with it ,but i recommend writing you're own.

## Overview
- Alacritty terminal emulator
- Starship
- Neovim
- Vim
- VSCode
- XDG Base Directory
- Other scripts

## Requirements
1. Linux/WSL/Mac terminal
2. Git (for installation)

## Installation
```bash
git clone https://github.com/ydkulks/dotfiles.git
cd dotfiles
bash install.bash
```

## Test Neovim environment
```bash
mkdir ~/.config/nvimexample
NVIM_APPNAME=nvimxample nvim ~/.config/nvimexample/init.lua
```
