#!/bin/bash

#Esta es la plantilla html
P="plantilla.html"

function convertir {

	#Contamos el número de lineas hasta donde empieza el cuerpo
	L=$(grep -n "CUERPO" "$P" | cut -d: -f1)
	#Y recortamos la primera parte
	head -n $(($L-1)) "$P" > "$2"

	#Añadimos el título, que será la la primera línea
	TI=$(head -n 1 "$1" | sed -e 's/^//g' )
	#echo "Título '$TI'"
	sed -i "s^TITULO^$TI^g" "$2"
	
	#Convertimos a markdown el fichero .md, y lo añadimos al .html
	markdown "$1" >> "$2"

	#Miramos el resto de la plantilla y la añadimos después
	LI=$(wc -l "$P" | cut -f 1 -d' ')
	tail -n $(($LI-$L)) "$P" >> "$2"
}

if [ ! -f "$P" ]; then
	echo "Error, no tengo la plantilla :("
	exit 1
fi

#Obtengo la lista de ficheros .md
FL=$(find . -name "*.md")

#Para cada fichero .md, creo su correspondiente .html
for FM in $FL; do
	#El nombre será el mismo pero con .html
	FH=$(echo "$FM" | sed -e 's/\.md$/\.html/g')

	#Si no existe el html lo creamos
	if [ ! -f "$FH" ]; then
		echo "Creando $FH"
		convertir "$FM" "$FH"

	#Si ya existe comprobamos la fecha, y si es reciente lo actualiza-
	#mos, o si la plantilla es más reciente
	elif [ "$FM" -nt "$FH" -o "$P" -nt "$FH" ];
	then
		echo "Actualizando $FH"
		convertir "$FM" "$FH"
	else
		echo "$FH está actualizado"
	fi
done
