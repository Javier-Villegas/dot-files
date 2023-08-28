#!/bin/sh
fonts=("ttc-iosevka" "ttf-firacode-nerd" "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji")
tools=("kitty" "wireshark-cli" "wireshark-qt" "nemo" "nemo-preview" "librewolf-bin" "flameshot" "neovim" "rofi")
comms=("discord" "thunderbird-bin" "teams")
remote=("openssh" "remmina" "barrier")
virtualisation=("qemu-full" "libvirtd" "docker")
fun=("steam-native-runtime" "stremio")
wm=("bspwm" "sxhkd" "xorg-server")

pkgs=("${fonts[@]}" "${tools[@]}" "${comms[@]}" "${remote[@]}" "${virtualisation[@]}" "${wm[@]}")


# Install yay
sudo pacman -Syu --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..:
rm -rf yay

yay -Syu python

sudo python manual_conf.py

yay -Syu ${pkgs[@]}

bash rebuild_config.sh

echo Don!
