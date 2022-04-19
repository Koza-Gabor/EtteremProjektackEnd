<?php

if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    if ($_GET['asztalok' ] == '') {
        $stmt = $pdo->prepare('SELECT * FROM asztalok');
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'PATCH') {
    $data = json_decode(file_get_contents('php://input'));
    $query = "UPDATE asztalok SET allapot='$data->allapot' WHERE id=".$data->id;
    $stmt = $pdo->query($query);
    return;
}
?>