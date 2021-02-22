# Metasploit
Es un script que nos permite auto instalar Metasploit-Framework en nuestra terminal Termux, desde los repositorios oficiales de su creador (rapid7), además, nos permite degradar la versión de ruby en Termux de (3.0.0) a (2.7.2), versión necesaria para el funcionamiento correcto de Metasploit. Una vez instalado, nos permite conectarnos automáticamente a la base de datos (postgresql) al ejecutar el comando (msfconsole).
# DEMO
![alt text](https://github.com/Darkmux/Metasploit/blob/main/Metasploit.png)
# PLATAFORMAS
* [√] Termux
# REQUISITOS
* [-] git
* [-] ruby
* [-] curl
# INSTALACIÓN
* $ termux-setup-storage
* $ pkg update && pkg upgrade -y
* $ pkg install git -y
* $ git clone https://github.com/Darkmux/Metasploit
* $ cd Metasploit
* $ chmod 777 msf.sh
* $ bash msf.sh
# Creado por Darkmux
# ©WHITE HACKS
