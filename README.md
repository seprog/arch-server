# Arch Server

```bash
SETUP_PATH=$PWD
sudo pacman --sync --needed --noconfirm base-devel
[[ -d /tmp/paru-bin ]] && sudo rm --recursive /tmp/paru-bin
git clone https://aur.archlinux.org/paru.git /tmp/paru-bin
cd /tmp/paru-bin
makepkg --syncdeps --install --needed --noconfirm
cd $SETUP_PATH
[[ -d /tmp/paru-bin ]] && sudo rm --recursive /tmp/paru-bin
paru -S --color=auto --needed --noconfirm $(grep "^[^#]" ./packages)
sudo systemctl enable --now NetworkManager.service
cp --recursive $SETUP_PATH/home/. ~
sudo chsh -s $(which fish) $USER
sudo reboot
```

## Remote Access / Monitoring
### ssh
core/openssh
### cockpit
extra/cockpit
extra/cockpit-docker
extra/cockpit-files
extra/cockpit-packagekit
extra/cockpit-storaged
extra/avahi
extra/networkmanager
extra/packagekit
extra/udisks2

## Shell
### fish (shell, replaces `bash`)
extra/fish
### man (manual pages)
core/man-db
### eza (list files, vetter `ls`)
extra/eza
### bat ((text) file content viewer, replaces `cat`)
extra/bat
### neovim (text editor, replaces `vim`)
extra/neovim
### btop (resource monitor, replaces `top`)
extra/btop
### fastfetch
extra/fastfetch
### ipinfo
aur/ipinfo-cli
### paru (package manager (`pacman`) interface with AUR support, replaces `pacman`)
aur/paru
core/base-devel
extra/devtools

## Other
### docker (container management)
extra/docker
extra/docker-buildx
extra/docker-compose
extra/pigz
### github
extra/github-cli
### gitlab
extra/glab
### git (version control system)
extra/git
### bun
aur/bun-bin
### python
core/python
extra/python-pip
### rust
extra/rust
### java (jdk)
extra/jdk-openjdk
