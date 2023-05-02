<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="estilo.css" rel="stylesheet">
</head>
<body>
    <?php 
        include('conexion.php');
    ?>
  <header>
    <h3>LISTADO DE CLIENTES</h3>    	
    <img src="banner_clientes.PNG" width="800" height="250">
  </header>
  <section>
    <table id="tColor" width="800" border="0" 
           cellpadding="0" cellspacing="0">
  	<tr>
            <th width="80">CODIGO</th>
            <th width="280">CLIENTE</th>
            <th width="280">DIRECCION</th>
            <th width="160">TELEFONO</th>
            <th width="160">DISTRITO</th>
            <th width="100">IMAGEN</th>
  	</tr>
        <?php 
            $rs=mysql_query("CALL SP_LISTADOCLIENTES",$cn);
            while($clientes = mysql_fetch_array($rs)){     
	  ?>
	<tr>
            <td><?php echo $clientes[0];?></td>
            <td><?php echo $clientes[1];?></td>
            <td><?php echo $clientes[2];?></td>
            <td><?php echo $clientes[3];?></td>
            <td><?php echo $clientes[4];?></td>
            
            <td>
            <?php 
                //Declarando el nombre del archivo a buscar
                $archivo = "fotos/".$clientes[0].".jpg";
                
                //Buscando el archivo 
                if (file_exists($archivo))
                    echo "<img src=fotos/".$clientes[0].".jpg width=60>";
                else 
                    echo "<img src=fotos/sinfoto.jpg width=60>";
            ?>
            </td>       
  	</tr>
        <?php 
            }
	  ?>
	</table>
  </section>
  <footer>
     <h5>Todos los derechos reservados @2015</h5>
     <h5>
        <a href="listadoo.php">LISTADO DE CLIENTES |</a>
        <a href="registroo.php">REGISTRO DE CLIENTES </a>
     </h5>
  </footer>
</body>
</html>
