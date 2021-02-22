#!/bin/bash
#
# [Open Source] - [Código Abierto]
#
# Metasploit: (21/02/2021)
#
# Variables
#
OS=$(uname -o)
USER=$(id -u)
PWD=$(pwd)
THOME="/data/data/com.termux/files/home"
TUSR="/data/data/com.termux/files/usr"
VERSION="6.0.27"
#
# Colores Resaltados
#
negro="[1;30m"
azul="[1;34m"
verde="[1;32m"
cian="[1;36m"
rojo="[1;31m"
purpura="[1;35m"
amarillo="[1;33m"
blanco="[1;37m"
#
# Colores Bajos
#
black="[0;30m"
blue="[0;34m"
green="[0;32m"
cyan="[0;36m"
red="[0;31m"
purple="[0;35m"
yellow="[0;33m"
white="[0;37m"
#
# Dependencias del Script
#
Dependencies(){
	if [ -d ${THOME}/storage ]; then
		PWD=$(pwd)
	else
		termux-setup-storage
	fi
	if [ -d ${TUSR}/include/openssl ]; then
		PWD=$(pwd)
	else
		pkg update && pkg upgrade -y
	fi
	if [ -d ${TUSR}/opt ]; then
		PWD=$(pwd)
	else
		mkdir -p ${TUSR}/opt
	fi
	if [ -x ${THOME}/bin/git ]; then
		PWD=$(pwd)
	else
		pkg install git -y
	fi
	if [ -x ${TUSR}/bin/ruby ]; then
		pkg uninstall ruby -y
	else
		PWD=$(pwd)
	fi
	if [ -x ${TUSR}/bin/curl ]; then
		PWD=$(pwd)
	else
		pkg install curl -y
	fi
	if [ -x ${TUSR}/bin/wget ]; then
		PWD=$(pwd)
	else
		pkg install wget -y
	fi
	if [ -d ${THOME}/metasploit-framework ]; then
		rm -rf ${THOME}/metasploit-framework
	else
		PWD=$(pwd)
	fi
	if [ -d ${TUSR}/opt/metasploit-framework ]; then
		rm -rf ${TUSR}/opt/metasploit-framework
	else
		PWD=$(pwd)
	fi
}
Metasploit(){
	sleep 0.5
	clear
echo -e "${azul}
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMM                MMMMMMMMMM
MMMNb                           vMMMM
MMMNl  ${blanco}MMMMM             MMMMM  ${azul}JMMMM
MMMNl  ${blanco}MMMMMMMN       NMMMMMMM  ${azul}JMMMM
MMMNl  ${blanco}MMMMMMMMMNmmmNMMMMMMMMM  ${azul}JMMMM
MMMNI  ${blanco}MMMMMMMMMMMMMMMMMMMMMMM  ${azul}jMMMM
MMMNI  ${blanco}MMMMMMMMMMMMMMMMMMMMMMM  ${azul}jMMMM
MMMNI  ${blanco}MMMMM   MMMMMMM   MMMMM  ${azul}jMMMM
MMMNI  ${blanco}MMMMM   MMMMMMM   MMMMM  ${azul}jMMMM
MMMNI  ${blanco}MMMNM   MMMMMMM   MMMMM  ${azul}jMMMM
MMMNI  ${blanco}WMMMM   MMMMMMM   MMMM#  ${azul}JMMMM
MMMMR  ${blanco}?MMNM             MMMMM ${azul}.dMMMM
MMMMNm  ${blanco}?MMM             MMMM  ${azul}dMMMMM
MMMMMMN  ${blanco}?MM             MM?  ${azul}NMMMMMN
MMMMMMMMNe                 JMMMMMNMMM
MMMMMMMMMMNm,            eMMMMMNMMNMM
MMMMNNMNMMMMMNx        MMMMMMNMMNMMNM
MMMMMMMMNMMNMMMMm+..+MMNMMNMNMMNMMNMM"${blanco}
}
Disclaimer(){
echo -e "${azul}
      ┌══════════════════════┐
      █ ${blanco}METASPLOIT-FRAMEWORK ${azul}█
      └══════════════════════┘
┌═══════════════════════════════════┐
█  ${blanco}ES UN PROYECTO DE CÓDIGO ABIERTO ${azul}█
█   ${blanco}PARA LA SEGURIDAD INFORMÁTICA,  ${azul}█
█    ${blanco}QUE PROPORCIONA INFORMACIÓN    ${azul}█
█   ${blanco}ACERCA DE VULNERABILIDADES DE   ${azul}█
█   ${blanco}SEGURIDAD Y AYUDA EN TESTS DE   ${azul}█
█   ${blanco}PENETRACIÓN (PENTESTING) Y EL   ${azul}█
█     ${blanco}DESARROLLO DE FIRMAS PARA     ${azul}█
█ ${blanco}SISTEMAS DE DETECCIÓN DE INTRUSOS ${azul}█
└═══════════════════════════════════┘
┌═══════════════════════════════════┐
█ ${blanco}METASPLOIT FUE ELIMINADO DE LOS   ${azul}█
█ ${blanco}REPOSITORIOS OFICIALES DE TERMUX  ${azul}█
█ ${blanco}DEBIDO A QUE LE DIERON UN MAL USO ${azul}█
█ ${blanco}CON LA PIRATERÍA Y POR ENDE SU    ${azul}█
█ ${blanco}INSTALACIÓN ES MUCHO MÁS COMPLEJA ${azul}█
└═══════════════════════════════════┘
┌═══════════════════════════════════┐
█ ${blanco}AL PULSAR ENTER, USTED ACEPTA EL  ${azul}█
█   ${blanco}USO ÉTICO Y CORRECTO DE ÉSTA    ${azul}█
█    ${blanco}HERRAMIENTA, CUALQUIER USO     ${azul}█
█ ${blanco}INDEBIDO DE ÉSTA MISMA QUEDA BAJO ${azul}█
█     ${blanco}SU PROPIA RESPONSABILIDAD     ${azul}█
└═══════════════════════════════════┘
"${blanco}
read
}
Installation(){
Metasploit
Disclaimer
pkg install -y libiconv zlib autoconf bison clang coreutils findutils apr apr-util libffi libgmp libpcap postgresql readline libsqlite openssl libtool libxml2 libxslt ncurses pkg-config make libgrpc termux-tools ncurses-utils ncurses unzip zip tar termux-elf-cleaner
cd ${TUSR}/opt
ln -sf ${TUSR}/include/libxml2/libxml ${TUSR}/include
apt-mark unhold ruby
curl -LO https://github.com/rapid7/metasploit-framework/archive/${VERSION}.tar.gz
tar -xf ${VERSION}.tar.gz
mv ${TUSR}/opt/metasploit-framework-${VERSION} ${TUSR}/opt/metasploit-framework
cp ${THOME}/Metasploit/ruby.deb ${TUSR}/opt
apt install -y ./ruby.deb
apt-mark hold ruby
cd ${TUSR}/opt/metasploit-framework
bundle config build.nokogiri --use-system-libraries
bundle update
wget https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt
bash fix-ruby-bigdecimal.sh.txt
mkdir -p ${TUSR}/var/lib/postgresql
initdb ${TUSR}/var/lib/postgresql
rm ${TUSR}/opt/${VERSION}.tar.gz
rm ${TUSR}/opt/ruby.deb
cd ${TUSR}/bin
curl -LO https://raw.githubusercontent.com/Darkmux/Metasploit/main/msfconsole
curl -LO https://raw.githubusercontent.com/Darkmux/Metasploit/main/msfvenom
chmod 777 msfconsole
chmod 777 msfvenom
echo -e "
[*] Metasploit Framework installation finished.
${verde}
msfconsole
msfvenom
"${blanco}
}
#
# Declarando Funciones
#
Dependencies
Installation
