.PHONY: sudoer
sudoer:
        su - && usermod -aG sudo sami

.PHONY: nogui
nogui:
        sudo systemctl set-default multi-user.target

.PHONY: screenoff
screenoff:
        sudo apt-get install vbetool && mkdir ~/startup && echo "vbetool dpms off" | tee ~/startup/close_screen.sh && chmod +x ~/startup/close_screen.sh && echo '@reboot root /home/sami/startup/close_screen.sh' | sudo tee -a /etc/crontab 

.PHONY: firmware
firmware:
	sudo sed -i 's|deb http://deb.debian.org/debian/ bullseye main|deb http://deb.debian.org/debian/ bullseye main|' /etc/apt/sources.list
	sudo apt-get update && sudo apt-get install firmware-linux-nonfree && sudo apt-get install firmware-realtek


.PHONY: install
install: sudoer nogui screenoff
