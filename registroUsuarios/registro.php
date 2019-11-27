<?php
    include("../conexion/conexion.php");
    // Recibir losDATos del formulario
    $usuario =$_POST["txtUsuario"];
    $contra =$_POST["txtpass"];
    //Crear la consulta
    $consulta ="CALL InsertaUsuario('$usuario','$contra')";
    $mensajeConsulta = mysqli_query($conectar,$consulta);
    $regUsuario = mysqli_fetch_assoc($mensajeConsulta);
    echo "<h2>".$regUsuario["MENSAJE"].    "</h2>";
    mysqli_close($conectar);



    // redireccionar a una pagina
    header("location:../login/autentificar.php");
    ?>