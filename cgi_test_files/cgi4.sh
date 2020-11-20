mysql -u dba -pdba2020 --database Hotel -e "select Reservas.Tipo_de_Habitacion, Reservas.Nombre, Reservas.Cantidad_de_mascotas, Reservas.Dia_de_la_reserva from Reservas where Dia_de_la_reserva = curdate();" > db.txt
db=db.txt
#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<!DOCTYPE html>'
echo '<html>'
echo '<head>'
echo '<meta charset="utf-8">'
echo '<meta name="description" content="Pagina web del hotel canino GUAU">'
echo '<title>Hello World</title>'
echo '</head>'
echo '<body>'
echo 	'<table>'
echo 		'<tr>'
echo			'<td>Tipo de Habitacion</td>'
echo			'<td>Nombre</td>'
echo			'<td>Cantidad de mascotas</td>'
echo			'<td>Dia de la reserva</td>'	
echo		'</tr>'
while  read Tipo_de_Habitacion Nombre Cantidad_de_mascotas Dia_de_la_reserva
	do 
echo		'<tr>'
echo			'<td>'$Tipo_de_Habitacion'</td>'
echo			'<td>'$Nombre'</td>'
echo			'<td>'$Cantidad_de_mascotas'</td>'
echo			'<td>'$Dia_de_la_reserva'</td>'
echo		'</tr>'
done < <(tail -n +2 "$db")
echo 	'</table>'
echo '</body>'
echo '</html>'


