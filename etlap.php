<?php

if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    if ($_GET['etlap'] == '') {
        $stmt = $pdo->prepare('SELECT * FROM etlap');
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents('php://input'));
    $stmt = $pdo->prepare('INSERT INTO etlap (category, name, osszetetel, alergia, price) VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$data->category, $data->name, $data->osszetetel, $data->alergia, $data->price]);
    $data->id = $pdo->lastInsertId();
    return;
}

if ($_SERVER['REQUEST_METHOD'] == 'PATCH') {
    $data = json_decode(file_get_contents('php://input'));
    $query = "UPDATE etlap SET category='$data->category', name='$data->name', osszetetel='$data->osszetetel', alergia='$data->alergia', price='$data->price' WHERE id=".$data->id;
    $stmt = $pdo->query($query);
    return;
}


if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    $data = json_decode(file_get_contents('php://input'));
    $query = "DELETE FROM etlap WHERE id =".$data->id;
    $stmt =$pdo->query($query);
    return;
    
}
?>