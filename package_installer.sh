#!/bin/sh
fonts=("ttc-iosevka" "ttf-firacode-nerd" "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji")
tools=("kitty" "wireshark-cli" "wireshark-qt" "nemo" "nemo-preview" "librewolf-bin" "flameshot" "neovim" "rofi" "zsh")
comms=("discord" "thunderbird-bin" "teams")
remote=("openssh" "remmina" "barrier")
virtualisation=("qemu-full" "libvirtd" "docker")
fun=("steam-native-runtime" "stremio")
wm=("bspwm" "sxhkd" "xorg-server" "xorg" "xorg-init" "nitrogen" "polybar" "dunst")
drivers=("mesa" "lib32-mesa" "pipewire" "pipewire-pulse" "pipewire-alsa" "pipewire-jack" "libva-mesa-driver" "lib32-libva-mesa-driver" "mesa-vdpau" "lib32-mesa-vdpau" "vulkan-radeon" "lib32-vulkan-radeon" "xf86-video-amdgpu" "amd-ucode")

pkgs=("${fonts[@]}" "${tools[@]}" "${comms[@]}" "${remote[@]}" "${virtualisation[@]}" "${wm[@]}" "${drivers[@]}")


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

echo Done!
