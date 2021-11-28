#! /bin/bash

# FedoraUpdate.sh

# Script para atualização e instalação de ferramentas mp Linux Fedora 35
# Autor: Francisco Junior
# E-mail: francisco.assissj@gmail.com
# Versão: 1.0

#----------------------------------------------------------------------------------------------------

echo ""
echo "Aperte <ENTER> para Continuar"
read
echo "***** ***** ***** ***** ***** *****"
echo "*****   UPDATE LINUX FEDORA   *****"
echo "***** ***** ***** ***** ***** *****"
echo ""
sleep 3
echo "Hora da Instalação:"
date
echo "***** DESEJA ATUALIZAR O SISTEMA?"
echo -n "Responda[S/N]: "
read RESPOSTA
test "$RESPOSTA" = "N" && exit # comando de escolha
test "$RESPOSTA" = "n" && exit
echo ""
echo "Vamos preparar o Linux Fedora para você com alguns simples comandos."
echo "***** ATUALIZANDO O SISTEMA"
echo ""
sleep 3
sudo dnf update -y && sudo dnf upgrade -y && sudo dnf autoremove -y
echo ""
echo "***** PRINCIPAIS REPOSITÓRIOS"
echo "***** RPM-FUSION *****"
echo ""
sleep 3
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo ""
echo "***** KERNEL E IDIOMAS DO SISTEMA"
echo ""
sleep 3
sudo dnf -y install kernel-headers && sudo dnf -y install kernel-devel && sudo dnf -y groupinstall "Development Tools" && sudo dnf -y groupinstall "Development Libraries" && sudo dnf -y install system-config-language && sudo dnf -y install system-config-language
echo ""
echo "***** COMPILADORES"
echo ""
sleep 3
sudo dnf -y install wget gcc gcc-c++ gcc-gfortran cmake gdb
echo ""
echo "***** FERRAMENTAS DIVERSAS"
echo ""
sleep 3
sudo dnf -y net-tools git ansible nmap htop bash-completion curl zsh tilix telnet
echo ""
echo "***** COMPACTADORES"
echo ""
sleep 3
sudo dnf install rar unrar zip unzip p7zip p7zip-plugins
echo ""
sleep 3
echo "***** ***** ***** ***** ***** *****"
echo "*****   INSTALAÇÃO CONCLUÍDA  *****"
echo "***** ***** ***** ***** ***** *****"