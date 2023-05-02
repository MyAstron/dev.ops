<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="estilo.css" rel="stylesheet">
</head>
<body>
    <header>
        <h3>REGISTRO DEL NUEVO CLIENTE</h3>
        <img src="banner_clientes.PNG" width="700" height="250"/>
    </header>
    <section>
     <?php 
        include('conecta.php');
        include('captura.php');
     ?>
        <form method="POST" action="graba.php" enctype="multipart/form-data">
         <table border="0" width="700" cellspacing="0" cellpadding="0">

            
             <tr>
                 <td width="500"></td>
                 <td>CODIGO
                     <input type="text" name="txtCodigo" 
                            value="<?php echo getCodigo(); ?>"
                            maxlength="5" size="50" readonly /> 
                 </td>
             </tr>
             <tr>
                 <td colspan="2">NOMBRES</td>
             </tr>
             <tr>
                 <td colspan="2">
                     <input type="text" name="txtNombres" size="112"/>
                 </td>
             </tr>
             <tr>
                 <td>PATERNO</td>
                 <td>MATERNO</td>
             </tr>
             <tr>
                 <td><input type="text" name="txtPaterno" size="50"/>
                 </td>
                 <td><input type="text" name="txtMaterno" size="50"/>
                 </td>
             </tr>
             <tr>
                 <td colspan="2">DIRECCION</td>
             </tr>
             <tr>
                 <td colspan="2">
                     <input type="text" name="txtDireccion" size="112"/> 
                 </td>
             </tr>
             <tr>
                 <td>FONO</td>
                 <td>DISTRITO</td>
             </tr>
             <tr>
                 <td><input type="text" name="txtFono" size="50"/>
                 </td>
                 <td><select name="selDistrito">
                       <?php
                          $rs=mysql_query('CALL SP_DISTRITOS',$cn);
                          $n=mysql_num_rows($rs);
                          while($distritos = mysql_fetch_array($rs)){
                            echo "<option value='".$distritos[0]."'>"
                                           .$distritos[1]."</option>";
                         }
                        ?>
                     </select></td>
             </tr>
             <tr>
                 <td>CORREO ELECTRONICO</td>
                 <td></td>
             </tr>
             <tr>
                 <td colspan="2"><input type="text" name="txtCorreo" 
                                        size="112"/></td>
             </tr>
             <tr>
                 <td><input type="submit" 
                            value="REGISTRAR" name="btnRegistrar" /></td>
                 <td><input type="file" name="filFoto" value="" /></td>
             </tr>
         </table>
     </form>
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
