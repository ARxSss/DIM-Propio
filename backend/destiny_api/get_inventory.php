<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

$servername = "localhost";
$username = "root";
$password = "";     
$dbname = "destinyinv"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["error" => "Conexión fallida: " . $conn->connect_error]));
}

$sql = "SELECT 
            inst.id_instancia,
            inst.id_def_item,
            inst.nivel_poder_actual,
            def.nombre,
            def.ruta_captura_pantalla, 
            def.id_rareza
        FROM instancias_items inst
        JOIN definiciones_items def ON inst.id_def_item = def.id_def_item";

$result = $conn->query($sql);

$items = array();

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $items[] = array(
            'instanceId' => $row['id_instancia'],
            'itemHash'   => $row['id_def_item'],
            'name'       => $row['nombre'],
            // CORREGIDO: Leemos la columna correcta y la guardamos como iconPath
            'iconPath'   => $row['ruta_captura_pantalla'], 
            'powerLevel' => $row['nivel_poder_actual'],
            'rarity'     => ($row['id_rareza'] == 4) ? 'Exotic' : 'Legendary'
        );
    }
} 

echo json_encode($items);

$conn->close();
?>