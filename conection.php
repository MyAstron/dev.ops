<?php
    $conection = mysql_connect("localhost", "root", "");
    if(mysql_select_db("VENTAS2015", $conection))
        echo '<script>alert("tudobem");</script>';
?>