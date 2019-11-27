<?php

$servidor = "localhost"; //127.0.0.1
$usuario = "root";
$contrasenia = "";
$bd = "mydb";

$conectar = mysqli_connect($servidor,
                            $usuario,
                            $contrasenia,
                            $bd)
                            or die ("Problemas al conectar con el servidor");


?>