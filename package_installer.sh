#!/bin/sh
fonts=("ttc-iosevka" "ttf-firacode-nerd" "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji")
tools=("kitty" "wireshark" "nemo" "nemo-preview" "librewolf-bin" "flameshot" "neovim" "rofi")
comms=("discord" "thunderbird-bin" "teams")
remote=("openssh" "remmina" "barrier")
virtualisation=("qemu-full" "libvirtd" "docker")
fun=("steam-native-runtime" "stremio")
wm=("bspwm" "sxhkd")

pkgs=("${fonts[@]}" "${tools[@]}" "${comms[@]}" "${remote[@]}" "${virtualisation[@]}" "${wm[@]}")


# Install yay
sudo pacman -Syu --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay


echo yay ${pkgs[@]}

bash rebuild_config.sh

echo Done!
