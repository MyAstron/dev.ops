<?php 
error_reporting(0);
 ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="estilo.css" rel="stylesheet">
</head>
<style type="text/css">
    #contenedor {
      width: 100%;
      height: 200px;
      border: 0px solid black;
      overflow: auto; /* añadimos scroll */
    }
</style>
<body>
    <?php 
        include('conexion.php');
    ?>
  <header>
    <h3>LISTADO DE CLIENTES</h3>    	
    <img src="banner_clientes.PNG" width="800" height="250">
  </header>
  <center>
    <form method="GET" action="clonado.php">
      Filtrar por:
      <select name="filtro"> <!-- comiendo del segundo spinner o select-->
        <option value="" 
          <?php if(is_null($_REQUEST["filtro"])) echo 'selected="true"'; ?>>
          General</option>
        <option value="Cdg"
          <?php if($_REQUEST["filtro"] == "Cdg") echo 'selected="true"'; ?>>
          Codigo</option>
        <option value="Nmb"
          <?php if($_REQUEST["filtro"] == "Nmb") echo 'selected="true"'; ?>>
          Nombre</option>
        <option value="Ptn"
          <?php if($_REQUEST["filtro"] == "Ptn") echo 'selected="true"'; ?>>
          Paterno</option>
        <option value="Mtn"
          <?php if($_REQUEST["filtro"] == "Mtn") echo 'selected="true"'; ?>>
          Materno</option>
        <option value="Drc"
          <?php if($_REQUEST["filtro"] == "Drc") echo 'selected="true"'; ?>>
          Direccion</option>
        <option value="Tlf"
          <?php if($_REQUEST["filtro"] == "Tlf") echo 'selected="true"'; ?>>
          Telefono</option>
        <option value="Dto"
          <?php if($_REQUEST["filtro"] == "Dto") echo 'selected="true"'; ?>>
          Distrito</option>
        <option value="EMl"
          <?php if($_REQUEST["filtro"] == "EMl") echo 'selected="true"'; ?>>
          E-Mail</option>
      </select> <!-- final del segundo spinner o del select-->
      <select name="distrito">
        <option value="">- Todo -</option>
        <?php 
                if (is_null($_REQUEST["filtro"])){
                  $rsc;
                }else if ($_REQUEST["filtro"] == "Dto"){
                  $rsc = mysql_query("SELECT * FROM DISTRITO",$cn);
                }else if ($_REQUEST["filtro"] == "Cdg") {
                  $rsc = mysql_query("SELECT ID_CLIENTE FROM CLIENTE", $cn);
                }

                while ($solicitud = mysql_fetch_array($rsc)) {
                  echo '<option value="'.$solicitud[0].'">'.$solicitud[0]."</option>";
                }
        ?>
      </select>
      <input type="submit">
    </form>
  </center>
  <section>
    <table id="tColor" width="800" border="0" 
           cellpadding="0" cellspacing="0">
  	<tr>
            <th width="80">CODIGO</th>
            <th width="100">NOMBRE</th>
            <th width="100">PATERNO</th>
            <th width="100">MATERNO</th>
            <th width="280">DIRECCION</th>
            <th width="100">TELEFONO</th>
            <th width="50">DISTRITO</th>
            <th width="280">E-MAIL</th>
  	</tr>
  </table>
<div id="contenedor">
  <table id="tColor" width="800" border="0" 
           cellpadding="0" cellspacing="0">
        <?php 
        $rs;
          if ($_REQUEST["distrito"] != $solicitud[0] | is_null($_REQUEST["distrito"]))
            $rs=mysql_query("select * from cliente where id_distrito='".$_REQUEST["distrito"]."';", $cn);
          else
            $rs=mysql_query("SELECT * FROM CLIENTE",$cn);
            while($clientes = mysql_fetch_array($rs)){     
	  ?>
	<tr>
            <td width="80"><?php echo $clientes[0];?></td>
            <td width="100"><?php echo $clientes[1];?></td>
            <td width="100"><?php echo $clientes[2];?></td>
            <td width="100"><?php echo $clientes[3];?></td>
            <td width="280"><?php echo $clientes[4];?></td>
            <td width="100"><?php echo $clientes[5];?></td>
            <td width="50"><?php echo $clientes[6];?></td>
            <td width="280"><?php echo $clientes[7];?></td>     
  	</tr>
        <?php 
            }
	  ?>
	</table>
</div>
  </section>
  <footer>
     <h5>Todos los derechos reservados @2015</h5>
     <h5>
        <a href="clonado.php">LISTADO DE CLIENTES |</a>
        <a href="Practicas(borrador).php">REGISTRO DE CLIENTES </a>
     </h5>
  </footer>
</body>
</html>
