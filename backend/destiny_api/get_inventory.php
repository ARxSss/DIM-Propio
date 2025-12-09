<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

$conn = new mysqli("localhost", "root", "", "destinyinv");

$characterId = $_GET['characterId'] ?? 0;

if ($characterId == 0) {
    echo json_encode([]);
    exit;
}

$sql = "SELECT 
            inst.id_instancia,
            inst.id_def_item,
            inst.nivel_poder_actual,
            def.nombre,
            def.ruta_captura_pantalla,
            def.id_rareza,
            slot.nombre as nombre_slot
        FROM instancias_items inst
        JOIN definiciones_items def ON inst.id_def_item = def.id_def_item
        JOIN slots_equipamiento slot ON def.id_slot_equipamiento = slot.id_slot
        WHERE inst.id_personaje_dueno = $characterId";

$result = $conn->query($sql);
$items = [];

while($row = $result->fetch_assoc()) {
    $items[] = $row;
}

echo json_encode($items);
$conn->close();
?>