<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $stmt = $pdo->prepare('SELECT * FROM felhasznalok');
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return;
  }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $data = json_decode(file_get_contents('php://input'));
  $stmt = $pdo->prepare('INSERT INTO felhasznalok (nev, kod, jog) VALUES (?, ?, ?)');
  $stmt->execute([$data->nev, $data->kod, $data->jog]);
  $data->id = $pdo->lastInsertId();
  return;
  }

  if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
  $data = json_decode(file_get_contents('php://input'));
  $query = "DELETE FROM felhasznalok WHERE id =".$data->id;
  $stmt =$pdo->query($query);
  return;
    
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $data = json_decode(file_get_contents('php://input'));

  if ($_GET['felhasznalok'] == 'login') {
    $stmt = $pdo->prepare('SELECT id, jog FROM felhasznalok WHERE nev = ? AND kod = ?');
    $stmt->execute([$data->nev, md5($data->kod)]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$data) {
      http_response_code(401);
      die('Authorization error');
    }
      return;
    }
}