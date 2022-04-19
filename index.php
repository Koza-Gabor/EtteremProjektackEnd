<?php
//use PDO;

require('./cors.php');
require('./secrets.php');

$pdo = new PDO('mysql:host=localhost;dbname=' . $secrets['mysqlDb'], $secrets['mysqlUser'], $secrets['mysqlPass']);

if ($development) {
  ini_set('display_errors', 1);
  error_reporting(E_ALL);
}

$resource = strtok($_SERVER['QUERY_STRING'], '=');
require('auth.php');

if ($resource == 'etlap') {
  require('etlap.php');
}
if ($resource == 'felhasznalok') {
  require('felhasznalok.php');
}
if ($resource == 'szekek') {
  require('szekek.php');
}
if ($resource == 'asztalok') {
  require('asztalok.php');
}
if ($resource == 'kosar') {
  require('kosar.php');
}

echo json_encode($data);