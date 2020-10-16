#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<!DOCTYPE html>'
echo '<html>'
echo '<head>'
echo	'<meta charset="utf-8">'
echo  	'<meta name="description" content="Pagina web del hotel canino GUAU">'
echo '</head>'
echo '<body>'
echo 	'<form action="./scriptrec.sh" method="get"> '
echo 		'<p>Usuario: <input type="text" name="usuario"></p>'
echo		'<p>Password: <input type="password" name="pass"></p>'
echo 		'<p><button type="submit">Reservas</button></p>'
echo 		'<p><button type="submit">Traslados</button></p>'
echo	'</form>'
echo '</body>'
echo '</html>'
