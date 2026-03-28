SETUP_PATH=$PWD


# Install package manager (paru)
sudo pacman --sync --needed --noconfirm base-devel git
[[ -d /tmp/paru ]] && sudo rm --recursive /tmp/paru

git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru
makepkg --syncdeps --install --needed --noconfirm
cd $SETUP_PATH

[[ -d /tmp/paru ]] && sudo rm --recursive /tmp/paru


# Install packages
paru -S --color=auto --needed --noconfirm $(grep "^[^#]" $SETUP_PATH/packages)


# Configure installation
cp --recursive $SETUP_PATH/home/. ~

sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now sshd.service
sudo systemctl enable --now cockpit.socket
sudo systemctl enable --now docker.service

sudo usermod -aG docker $USER

sudo chsh -s $(which fish) $USER


# Activate
read -p "Reboot now? [y/N] " -n1 && [[ $REPLY =~ ^[Yy]$ ]] && sudo reboot
