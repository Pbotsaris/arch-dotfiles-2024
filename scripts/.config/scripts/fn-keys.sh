echo "options hid_apple fnmode=8" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo mkinitcpio -P
sudo systemctl reboot
