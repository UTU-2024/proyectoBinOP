#!/bin/bash
echo "Content-type: text/html"
echo ""
echo '<!DOCTYPE html>'
echo '<html>'
echo '<head>'
echo '<meta charset="utf-8">'
echo '<meta name="description" content="Pagina web del hotel canino GUAU">'
echo '<title>Traslados - Hotel Canino GUAU</title>'
echo '</head>'
echo '<body>'
echo 	'<table>'
echo 		'<tr>'
echo			'<td>ID</td>'
echo			'<td>Cantidad de mascotas</td>'
echo			'<td>Horarios traslados</td>'
echo			'<td>Tiempo del recorrido</td>'
echo			'<td>Destino</td>'
echo 			'<td>Fecha</td>'
echo		'</tr>'
while  read ID Cantidad_de_mascotas Horarios_traslados Tiempo_del_recorrido Destino Fecha
	do 
echo		'<tr>'
echo			'<td>'$ID'</td>'
echo			'<td>'$Cantidad_de_mascotas'</td>'
echo			'<td>'$Horarios_traslados'</td>'
echo			'<td>'$Tiempo_del_recorrido'</td>'
echo			'<td>'$Destino'</td>'
echo			'<td>'$Fecha'</td>'
echo		'</tr>'
done < <(./db2.sql | column -t)
echo 	'</table>'
echo '</body>'
echo '</html>'


