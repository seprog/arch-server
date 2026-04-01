# Arch Server

```bash
SETUP_PATH=$PWD
sudo pacman --sync --needed --noconfirm base-devel git
[[ -d /tmp/paru ]] && sudo rm --recursive /tmp/paru
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg --syncdeps --install --needed --noconfirm
cd $SETUP_PATH
[[ -d /tmp/paru ]] && sudo rm --recursive /tmp/paru
paru -S --color=auto --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)
cp --recursive $SETUP_PATH/home/. ~
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now sshd.service
sudo systemctl enable --now cockpit.socket
sudo systemctl enable --now docker.service
sudo usermod -aG docker $USER
sudo chsh -s $(which fish) $USER
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
extra/pcp
extra/networkmanager
extra/packagekit
extra/udisks2

## Shell
### fish (shell, replaces `bash`)
extra/fish
### man (manual pages)
core/man-db
### ripgrep
extra/ripgrep
### eza (list files, replaces `ls`)
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
