#! /bin/bash

apt update

apt install samba openssh crunch hydra ftp apache2 g++ hashcat fail2ban apparmor lynis crunch python3 php sqlite3 sqlitebrowser sqlmap conky-all flatpak pacman crispy-doom docker.io kate neovim vlc audacious fcitx5  fcitx5-configtool   fcitx5-qt5-immodule-probing rofi flameshot baoba curl wget git nmap wine wireshark curl wget git htop suricata lynis clamav binwalk gnupg burpsuite strings golang-go

echo "Agregar al usuario de samba \n\n"

smbpasswd -a $USER


echo "A continuacion se instalara metasploit \n\n"


curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

echo "Instalar nuclei \n\n"

go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

cp ~/go/bin/nuclei /usr/local/bin/nuclei

chmod 777 /usr/local/bin/nuclei

clear

echo "A continuacion se configurara el firewall  \n\n"

ufw enable

ufw default deny incoming
ufw default deny outgoing

ufw allow http

ufw allow https

ufw allow ssh

ufw allo smb

echo "Configurando fail2ban"


echo "[DEFAULT]

bantime = 20m

maxretry = 4


[sshd]
enable = true
port =  2001
backend = auto
logpath = /var/log/auth.log

[samba]
enable = true
backend = auto
port = 139,445
logpath = /var/log/samba/log.smbd" > /etc/fail2ban/jail.local


echo "Port 2001" >> /etc/ssh/sshd_config

clear

echo -e "\e[32m Instalando inecraft si \e[0m"

wget "https://release-assets.githubusercontent.com/github-production-release-asset/1254575767/6d4324a7-1229-4b29-994c-c4f71f656941?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-11-23T22%3A54%3A14Z&rscd=attachment%3B+filename%3DSKlauncher-4.0.58-x86_64.AppImage&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-11-23T21%3A54%3A10Z&ske=2026-11-23T22%3A54%3A14Z&sks=b&skv=2018-11-09&sig=5mB1q33JIw6lEQK3nR%2BTrrDuiCHQoC0sz2SwsDPrDNo%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5NTQ3NDgwOSwibmJmIjoxNzk1NDcxMjA5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.jL6ZbYJFZUOjJgHdvHDFNeZ4Fl91uP2Z__n1DcIaeFs&response-content-disposition=attachment%3B%20filename%3DSKlauncher-4.0.58-x86_64.AppImage&response-content-type=application%2Foctet-stream" -o /home/$USER/skaluncher.appimage

echo "YA!!! instalacion terminada"
