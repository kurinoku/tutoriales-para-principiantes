#lang pollen

◊define[PATH-EXAMPLE]{C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Users\cris2\AppData\Local\Programs\Python\Python310\Scripts\;C:\Users\cris2\AppData\Local\Programs\Python\Python310\}

◊title{01. Git y Bash}

Windows + R para abir la aplicación "Windows Run"

Esta pequeña aplicación permite ejecutar programas que están disponibles
en la instalación actual de Windows a través de varios mecanismos.

Entre esos mecanismos nos concetraremos en la variable de entorno ◊term{PATH}.

La variable de entorno PATH es una ◊term{string} que contiene una lista de
◊term{rutas}.

Lo siguiente es un ejemplo de lo que puede contener path.
◊text-quote{◊PATH-EXAMPLE}

Escribe cmd en Windows Run y presiona enter.

Esto abrirá cmd.

Comandos básicos de cmd. Para cualquiera de estos comandos uno puede usar la sintaxis

◊text-quote{<comando> /?}
Para averiguar más sobre las opciones y como usar el comando, ya que en las
siguientes se elegieron las opciones más simples y relevantes.

◊cmd-fn{cd [ruta] - cambia el directorio de trabajo actual a <ruta>.}
◊cmd-fn{dir [/B] - lista los contenidos del directorio actual.}
◊cmd-fn{echo [<string> ...] - escribe todas las <string> a pantalla.}

◊text-quote{
Ejemplo:
C:\Users\pc0000\> echo %PATH%
◊PATH-EXAMPLE

}

