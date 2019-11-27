<?php
include("../conexion/conexion.php");
$user = $_POST["txtUsuario"];
$pass = $_POST["txtpass"];

$consulta="SELECT * FROM usuarios WHERE usuarios.usuario='$user' 
AND usuarios.contrasenia = '$pass'";
$rol="SELECT persona_rol.id_rol FROM persona_rol join rol on rol.id_rol=persona_rol.id_rol join persona on persona.id_persona=persona_rol.id_persona";
$ejecConsulta = mysqli_query($conectar, $consulta);
$regRol=mysqli_query($conectar,$rol);
$regUsuario = mysqli_fetch_assoc($ejecConsulta);

if($regUsuario["usuario"]== $user && $regUsuario["contrasenia"]== $pass){
    session_start();
    $_SESSION["usuario"]= $user;
    $_SESSION["rol"]= $regRol["id_Rol"];    


    //redireccione al index
    header("location:../productos/productoprincipal.php");
}else{
    echo "DATOS INCORRECTOS, INTENTE DE NUEVO";
    echo "<br><a href='login.php'>INICIAR SESION</a>";
}
?>