#!/bin/bash
#
# [Open Source] - [Código Abierto]
#
# Metasploit: (10/02/2021)
#
# Variables
#
OS=$(uname -o)
USER=$(id -u)
PWD=$(pwd)
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
	if [ -d ${HOME}/storage ]; then
		PWD=$(pwd)
	else
		termux-setup-storage
	fi
	if [ -x ${PREFIX}/bin/git ]; then
		PWD=$(pwd)
	else
		pkg install git -y
	fi
	if [ -x ${PREFIX}/bin/ruby ]; then
		PWD=$(pwd)
	else
		pkg install ruby -y
	fi
	if [ -x ${PREFIX}/bin/curl ]; then
		PWD=$(pwd)
	else
		pkg install curl -y
	fi
}
Metasploit() {
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
	cd
	curl -LO https://raw.githubusercontent.com/Darkmux/Metasploit/main/metasploit.sh
	chmod 777 metasploit.sh
	bash metasploit.sh
	rm metasploit.sh
}
#
# Declarando Funciones
#
Dependencies
Installation
