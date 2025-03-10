#!/bin/bash

file="datos.csv"

touch "$file"

echo "nombre,telefono,email" > "$file"

while true; do

echo "============MENU============"
echo "== 1.Imprimir             =="
echo "== 2.Introducir datos     =="
echo "== 3.Buscar por nombre    =="
echo "== 4.Buscar por email     =="
echo "== 5.Buscar por telefono  =="
echo "== 6.Borrar por email     =="
echo "== 7.Salir                =="
echo "============================"
read -p "Selecciona una opcion: " op
 case "$op" in
	1)
	cat "$file"
	;;
	2)
	echo "Ingrese los datos separados por coma(,)"
	read -p "nombre,telefono,email: " info
	echo "$info" >> "$file"
	;;
	3)
	read -p "Ingresa el nombre: " nombre
	grep -i "^$nombre," "$file"
	;;
	4)
	read -p "Ingrese el email: " email
	grep -i ",$email$" "$file" 
	;;
	5)
	read -p "Ingrese el telefono: " telefono
	grep -i ",$telefono," "$file"
	;;
	6)
	read -p "Ingrese el email para elminar: " email
	sed -i "/,$email$/d" "$file"
	;;
	7)
	echo "SH finalizado!!!"
	exit
	;;
	*)
	echo "Opcion no existente!!"
	;;
 esac
done



