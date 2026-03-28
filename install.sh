SETUP_PATH=$PWD

# Install paru
sudo pacman --sync --needed --noconfirm base-devel
[[ -d /tmp/paru-bin ]] && sudo rm --recursive /tmp/paru-bin
git clone https://aur.archlinux.org/paru.git /tmp/paru-bin
cd /tmp/paru-bin
makepkg --syncdeps --install --needed --noconfirm
cd $SETUP_PATH
[[ -d /tmp/paru-bin ]] && sudo rm --recursive /tmp/paru-bin

# Install packages
paru -S --color=auto --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)

# Configuration
sudo systemctl enable --now NetworkManager.service
cp --recursive $SETUP_PATH/home/. ~
sudo chsh -s $(which fish) $USER

# Activate
sudo reboot
