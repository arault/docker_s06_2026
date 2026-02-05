<?php
  $connect = new PDO("mysql:dbname=information_schema;host=db","root","azerty") or die ("Pb");

  echo "Connexion OK";
?>
