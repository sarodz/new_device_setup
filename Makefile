.PHONY: sudoer
sudoer:
        su - && usermod -aG sudo sami

.PHONY: nogui
nogui:
        sudo systemctl set-default multi-user.target

.PHONY: screenoff
screenoff:
        sudo apt-get install vbetool && mkdir ~/startup && echo "vbetool dpms off" | tee ~/startup/close_screen.sh

.PHONY: install
install: sudoer nogui screenoff
