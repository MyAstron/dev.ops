<?php
  error_reporting(0);
  // if(error_reporting(0)) echo '<script>alert("Todo piola bb");</script>';
  include('./action.php');
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Practicas (Local)</title>
    <link href="./style.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b9cc2cff93.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <header>
      <h3>LISTADO DE CLIENTES</h3>    	
      <img src="./imagen.avif" width="800">
    </header>
    <center>
      <form method="GET" action="./">
        Filtrar por:
        <div <?php if(isset($_GET["filtro"])) echo 'style="display: none;"';?>>
          <select name="filtro">
            <option value="" <?php if(is_null($_REQUEST["filtro"])) echo 'selected="true"'; ?>>- General -</option>
            <?php 
              foreach($filtros as $seleccion){
                echo '<option value="'.$seleccion.'"';
                if($_REQUEST["filtro"] == $seleccion) echo 'selected="true"';
                echo '> '.$seleccion.' </option>';
              }
            ?>
          </select>
          <input type="submit" value="Procesar">
        </div>
        <div <?php if(!isset($_GET["filtro"]) | $_GET["filtro"] == "" & $_GET["sub-filtro"] != "") echo 'style="display: none;"';?>>
          <select name="sub-filtro">
            <option value="">- Todo -</option>
            <?php
             $areglo = array();
              if ($_GET["filtro"] ==  $filtros[0])
                  $areglo = $unidad_organizacional;
              if ($_GET["filtro"] == $filtros[1])
                  $areglo = $departamentos;
              if ($_GET["filtro"] == $filtros[2])
                  $areglo = $centro_costos;
              if ($_GET["filtro"] == $filtros[3])
                  $areglo = $sub_centro;
              if ($_GET["filtro"] == $filtros[4])
                  $areglo = $nombres;
              if ($_GET["filtro"] == $filtros[5])
                  $areglo = $correo;
              if ($_GET["filtro"] == $filtros[6])
                  $areglo = $extencion;
              if ($_GET["filtro"] == $filtros[7])
                  $areglo = $cel;
              foreach($areglo as $elemento)
                echo '<option value="'.$elemento.'"> '.$elemento.' </option>';
            ?>
          </select>
          <input type="submit">
        </div>
        <?php
          if(isset($_GET["filtro"]) & $_GET["filtro"] == "") 
            echo '<a class="flt"> General </a>'; 
          else if(isset($_GET["filtro"]) & $_GET["filtro"] != "") 
            echo '<a class="flt"> '.$_GET["filtro"]." </a>";
          if (isset($_GET["sub-filtro"]) & $_GET["sub-filtro"] != "")
            echo '─ <a class="flt"> '.$_GET["sub-filtro"]." </a>";
          echo ' • ';
          if(isset($_GET["filtro"]))
            echo '<a href="javascript:history.back()" id="back"><i class="fa-solid fa-rotate-left"></i> Filtro Anterior</a>';
        ?>
      </form>
    </center>
    <section>
      <table id="tColor" width="95%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <th width="12%">Organizacion</th>
          <th width="12%">Departamento</th>
          <th width="12%">Centro de Costo</th>
          <th width="10%">Sub-Centro</th>
          <th width="">Nombre</th>
          <th width="15%">Correo</th>
          <th width="5%">Extencion</th>
          <th width="5%">Cel.</th>
        </tr>
      </table>
      <div id="contenedor">
        <table id="tColor" width="95%" border="0" cellpadding="0" cellspacing="0">
          <?php
          if ($_GET["sub-filtro"] == "" | $_GET["filtro"] == "")
            MySQL_Query_General($lista_clientes, $nombres, $medidas);
          else
            MySQL_Query_Filtro($areglo, $medidas);
          ?>
        </table>
      </div>
    </section>
    <footer>
      <h5>Todos los derechos reservados | Grupo de practicas 2023 &copy; 2023 </h5>
      <!-- <h5>
        <a href="#">LISTADO DE CLIENTES |</a>
        <a href="#">REGISTRO DE CLIENTES </a>
      </h5> -->
    </footer>
  </body>
</html>
