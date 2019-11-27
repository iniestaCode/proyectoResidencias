<?php

session_start();
session_destroy();
//redireccionar index o al login
header("local:../index.html");

?>