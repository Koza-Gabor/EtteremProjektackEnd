<?php

if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    if ($_GET['szekek' ] == '') {
        $stmt = $pdo->prepare('SELECT * FROM szekek');
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'PATCH') {
    $data = json_decode(file_get_contents('php://input'));
    $query = "UPDATE szekek SET asztal_id='$data->asztal_id', allapot='$data->allapot' WHERE id=".$data->id;
    $stmt = $pdo->query($query);
    return;
}
?>