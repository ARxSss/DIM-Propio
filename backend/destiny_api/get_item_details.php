<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');

$servername = "localhost"; $username = "root"; $password = ""; $dbname = "destinyinv";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) die(json_encode(["error" => "Error DB"]));

$instanceId = $_GET['instanceId'] ?? 0;

$response = [
    "info"  => [], // Aquí irá el Lore y Descripción
    "stats" => [],
    "perks" => []
];

if ($instanceId) {
    $sqlInfo = "SELECT def.descripcion, def.texto_lore, tipo.nombre as energia_nombre, tipo.ruta_icono as energia_icono
                FROM instancias_items inst
                JOIN definiciones_items def ON inst.id_def_item = def.id_def_item
                LEFT JOIN tipos_energia tipo ON def.id_tipo_energia_default = tipo.id_tipo_energia
                WHERE inst.id_instancia = $instanceId";
    
    $resultInfo = $conn->query($sqlInfo);
    if($row = $resultInfo->fetch_assoc()) {
        $response["info"] = $row;
    }

    $sqlStats = "SELECT def.nombre, est.valor 
                 FROM estadisticas_instancia est
                 JOIN definiciones_estadisticas def ON est.id_estadistica = def.id_estadistica
                 WHERE est.id_instancia = $instanceId";
    $resultStats = $conn->query($sqlStats);
    while($row = $resultStats->fetch_assoc()) $response["stats"][] = $row;

    $sqlPerks = "SELECT def.nombre, def.descripcion, def.ruta_icono, p.esta_activo
                 FROM perks_instancia p
                 JOIN definiciones_perks def ON p.id_def_perk = def.id_def_perk
                 WHERE p.id_instancia = $instanceId
                 ORDER BY p.indice_socket";
    $resultPerks = $conn->query($sqlPerks);
    while($row = $resultPerks->fetch_assoc()) $response["perks"][] = $row;
}

echo json_encode($response);
$conn->close();
?>