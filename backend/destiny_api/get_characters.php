<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

$conn = new mysqli("localhost", "root", "", "destinyinv");
if ($conn->connect_error) { die("Conexión fallida: " . $conn->connect_error); }

$sql = "SELECT p.id_personaje, p.nivel_luz, p.ruta_emblema, c.nombre_clase 
        FROM personajes p
        JOIN clases c ON p.id_clase = c.id_clase
        WHERE p.id_usuario = 1";

$result = $conn->query($sql);
$chars = [];

while($row = $result->fetch_assoc()) {
    $chars[] = $row;
}

echo json_encode($chars);
$conn->close();
?>