#!/usr/bin/env bash

pkgs="

### Multimedia
mpv
nsxiv
zathura

### Dependencies/Mini-Tools
ffmpegthumbnailer
fzf
jq
poppler
rofi
slurp
tree
wlr-randr
yq
zoxide

### Development
docker
docker-compose
k9s
kubectl
python-pip
python-pipx
gcolor3

### General Tools
bc
bitwarden-cli
bitwarden-rofi
btop
imagemagick
man-db
tesseract-data-eng
tldr
tmux
unarchiver
unzip
wget
zbar
zellij
zip

### Coreutils-NG
bat
duf
dust
lsd
prettyping
ripgrep

### System
bind
bluez
bluez-utils
dmidecode
dnsmasq
less
libnotify
libvirt
plymouth
pulseaudio
pulseaudio-bluetooth
sof-firmware
vim
zsh

### Desktop Environment
font-manager
glava
hyprland
hyprpicker
kvantum
nemo
pavucontrol
polkit-kde-agent
qt5-wayland
qt5ct
qt6-wayland
qt6ct
starship
swaync
swayosd
swww
wdisplays
wl-clipboard
wlogout
xdg-desktop-portal-hyprland

### Applications
audacity
chromium
eww
firefox
floorp-bin
gimp
gitkraken
inkscape
inkscape
kitty
libreoffice
mtpaint
neomutt
neovim
obsidian
okular
pinta
prismlauncher
qemu-full
signal-desktop
swww
thunderbird
virt-manager
virtualbox
yazi

### Hacking
aircrack-ng
arp-scan
arpwatch
beef-xss
bettercap
binwalk
burpsuite
capstone
ccze
cewl
chisel-tunnel
chntpw
commix
crunch
dirb
dirbuster
dnsenum2
dsniff
dsniff
ettercap
fcrackzip
feroxbuster-bin
ffuf
foremost
ghidra
gnu-netcat
gobuster
gophish
hashcat
hashcat-utils
hashid
havoc-c2-git
hcxkeys
hcxtools
httrack
hydra
ida-free
john
lynis
macchanger
maltego
metasploit
metasploit-payload-creator
netdiscover
nikto
nmap
powershell
python-updog
recon-ng
rkhunter
scapy
sherlock-git
sliver
sqlmap
steghide
stegsolve
sublist3r-git
tcpdump
theharvester-git
tiger
trufflehog
wapiti
whatweb
wifite
wireshark-gtk2
wpscan

# Fonts
# nerd-fonts-complete-mono-glyphs
# noto-fonts-full-git
ttf-firacode
ttf-firacode-nerd
ttf-twemoji

"

pkgs=$(echo "$pkgs" | perl -pe 's/#.*$//; s/^ +$\n//; s/\n/ /')

for pkg in $pkgs
do
	if yay -Q $pkg &>/dev/null
	then
		pkgs=$(echo " $pkgs " | perl -pe "s/ $pkg / /")
	fi
done

echo "Packages to install:"
echo $pkgs
test -z $pkgs || yay -S $pkgs
