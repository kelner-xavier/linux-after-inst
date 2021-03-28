#!/bin/bash
# ____              ___  ____       _     __ _              ___           _   
#|  _ \ ___  _ __  / _ \/ ___|     / \   / _| |_ ___ _ __  |_ _|_ __  ___| |_ 
#| |_) / _ \| '_ \| | | \___ \    / _ \ | |_| __/ _ \ '__|  | || '_ \/ __| __|
#|  __/ (_) | |_) | |_| |___) |  / ___ \|  _| ||  __/ |     | || | | \__ \ |_ 
#|_|   \___/| .__/ \___/|____/  /_/   \_\_|  \__\___|_|    |___|_| |_|___/\__|
#           |_|               
          
#Atualizar a lista dos repositórios para o mirror da UFAL
sudo echo "deb http://repositorio.nti.ufal.br/ubuntu/ focal main restricted universe multiverse
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
sudo apt update && sudo apt upgrade -y
sudo apt install -y wine obs-studio qbittorrent openjdk-13-jdk-headless gdebi gnome-tweaks telegram-desktop discord vlc vim steam steam-devices

#Flatpaks
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community com.axosoft.GitKraken

#Lutris
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris

#Brave
sudo apt install -y apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
sudo echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

#Anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update
apt install anydesk

#Chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo gdebi -y google-chrome-stable_current_amd64.deb

#Customização
mkdir .themes .icons

wget "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTIyNTU0MzAiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjY1NzZjNTJhOTM5OTBkMDA2MTM1ZDU5YzM4NTA3NjZiNjkzODM5ODNmMTU1MTA0YTdlNmJiYmNiOGRlOTk4NTQ2MWMxMDllNzA1MjU3Y2NkYTU4MGRlNGVhODRlMjMwOTM2MWE0ZjZjNzMwODYwNjUwYTk4ZDkwMmJkMmY0ZDRjIiwidCI6MTYxNTkwMTIwMywic3RmcCI6IjBjZmMzOTE3ZDcyMmY4YWQwMDk0ZTMzMmU3YWM0ODUzIiwic3RpcCI6IjE3Ny4xMzcuOTAuOTUifQ.RlYqYkPBf8X19UQlJrzqwNFrWDWyWZiJOouI5r8zgss/06-Flat-Remix-Darkest-fullPanel_20210202.tar.xz"
tar -xvf 06-Flat-Remix-Darkest-fullPanel_20210202.tar.xz && mv Flat-Remix-* .themes

wget "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTEzMDUwNzIiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImFjYjljYzk2OGZhMTRkZjU3MWRkOGU2M2I4MDQ0MDZhMWM5Y2FkNDI1M2I0Nzc5MzFjNGY5ZTFhMDYyMDM2MzI3NjBlMGZmYjg0NmQ2ODQ3ODE1MDY4MWExZjM0NWMyNzBhYmRmZWYzOWRhZDlmZDc0ZDJkYmY1MTYxMjI5ZGUyIiwidCI6MTYxNTkwNTg3MSwic3RmcCI6IjJiMzllNjY2NWJkZWVkZDAyOTkzM2QyNWU5ZmVjZWE4Iiwic3RpcCI6IjE3Ny4xMzcuOTAuOTUifQ.N8IQtnV9l2sqHpwxlJ354T-GWoX0tBKZUIkl0-zY8RE/08-Flat-Remix-Red-Dark_20210121.tar.xz"
tar -xvf 08-Flat-Remix-Red-Dark_20210121.tar.xz && mv Flat-Remix-Red-Dark/ .icons

wget "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MDY2NDYwMTEiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImNmMjUzNDEzNWYwZDkyMTRmNGZlMmE4NThmNTU0ZjIyZTYwN2VlY2NkNjgwNjc3MThjNTJkNzIyZTFhNWQ4NjE4ZWMyNTU2ZDU0YWQ2MGZkZDI2ODAwNzI2YWE0YmZmMjU0YTFiYWU5N2MzZmY5YzRjMDY2ZTQ0MTc4ODlhODI5IiwidCI6MTYxNTkwNjE3OCwic3RmcCI6IjJiMzllNjY2NWJkZWVkZDAyOTkzM2QyNWU5ZmVjZWE4Iiwic3RpcCI6IjE3Ny4xMzcuOTAuOTUifQ.fJV5WUzmX28xYfzW7jl8d7Q64x65koM_G737JWfC-l8/09-Flat-Remix-GTK-Red-Darkest-NoBorder_20201129.tar.xz"
tar -xvf 09-Flat-Remix-GTK-Red-Darkest-NoBorder_20201129.tar.xz && mv Flat-Remix-GTK-Red-Darkest-NoBorder/ .themes

