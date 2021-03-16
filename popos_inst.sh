 #!/bin/bash
sudo su

#Atualizar a lista dos repositórios para o mirror da UFAL
echo "deb http://repositorio.nti.ufal.br/ubuntu/ focal main restricted universe multiverse
deb-src http://repositorio.nti.ufal.br/ubuntu/ focal main restricted universe multiverse

deb http://repositorio.nti.ufal.br/ubuntu/ focal-security main restricted universe multiverse
deb-src http://repositorio.nti.ufal.br/ubuntu/ focal-security main restricted universe multiverse

deb http://repositorio.nti.ufal.br/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://repositorio.nti.ufal.br/ubuntu/ focal-updates main restricted universe multiverse

deb http://repositorio.nti.ufal.br/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://repositorio.nti.ufal.br/ubuntu/ focal-backports main restricted universe multiverse

deb http://apt.pop-os.org/proprietary focal main
" > /etc/apt/sources.list

#Apps do repositório pré-instaldo
apt update && apt upgrade -y
apt install telegram-desktop discord vlc vim steam steam-devices -y 

#Brave
sudo apt install apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser

