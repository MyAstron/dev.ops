<?php
    $filtros = array(
        "Organizacion",
        "Departamentos",
        "Centro de Costo",
        "Sub-Centro de Costo",
        "Nombre",
        "Correo",
        "Extencion",
        "Celular"
    );
    $unidad_organizacional = array(
        "unidad 0",
        "unidad 1", 
        "unidad 2", 
        "unidad 3", 
        "unidad 4", 
        "unidad 5", 
        "unidad 6", 
        "unidad 7", 
        "unidad 8", 
        "unidad 9"
    );
    $departamentos = array(
        "departamento 0",
        "departamento 1",
        "departamento 2",
        "departamento 3",
        "departamento 4",
        "departamento 5",
        "departamento 6",
        "departamento 7",
        "departamento 8",
        "departamento 9"
    );
    $centro_costos = array(
        "centro de costos 0",
        "centro de costos 1",
        "centro de costos 2",
        "centro de costos 3",
        "centro de costos 4",
        "centro de costos 5",
        "centro de costos 6",
        "centro de costos 7",
        "centro de costos 8",
        "centro de costos 9"
    );
    $sub_centro = array(
        "sub-centro 0",
        "sub-centro 1",
        "sub-centro 2",
        "sub-centro 3",
        "sub-centro 4",
        "sub-centro 5",
        "sub-centro 6",
        "sub-centro 7",
        "sub-centro 8",
        "sub-centro 9"
    );
    $nombres = array(
        "nombre 0",
        "nombre 1",
        "nombre 2",
        "nombre 3",
        "nombre 4",
        "nombre 5",
        "nombre 6",
        "nombre 7",
        "nombre 8",
        "nombre 9"
    );
    $correo = array(
        "correo.0@practicas.local",
        "correo.1@practicas.local",
        "correo.2@practicas.local",
        "correo.3@practicas.local",
        "correo.4@practicas.local",
        "correo.5@practicas.local",
        "correo.6@practicas.local",
        "correo.7@practicas.local",
        "correo.8@practicas.local",
        "correo.9@practicas.local"
    );
    $extencion = array(
        "0000",
        "0001",
        "0002",
        "0003",
        "0004",
        "0005",
        "0006",
        "0007",
        "0008",
        "0009"
    );
    $cel = array(
        "0000 0000",
        "0000 0001",
        "0000 0002",
        "0000 0003",
        "0000 0004",
        "0000 0005",
        "0000 0006",
        "0000 0007",
        "0000 0008",
        "0000 0009"
    );
    $lista_clientes = array(
        $unidad_organizacional,
        $departamentos,
        $centro_costos,
        $sub_centro,
        $nombres,
        $correo,
        $extencion,
        $cel
    );
    $medidas = array(
        "12%",
        "12%",
        "12%",
        "10%",
        "",
        "15%",
        "5%",
        "5%"
    );
    $json_datos = json_encode($lista_clientes);
    function MySQL_Query_Filtro($array, $medidas) {
        foreach($array as $elemento){
            if ($elemento == 0)
                echo '<tr>';
            else if ($elemento == 7)
                echo '</tr>';
            else
                echo '<td width="'.$medidas[$elemento].'">'.$array[$elemento].'</td>';
        }
    }
    function MySQL_Query_General($lista_clientes, $nombres, $medidas){
        for($fila = 0; $fila < count($lista_clientes); $fila++){
          echo '<tr>';
          for ($columna = 0; $columna < count($nombres); $columna++)
            if($columna == 5)
              echo '<td width="'.$medidas[$columna].'"><a href="mailto:'.$lista_clientes[$columna][$fila].'">'.$lista_clientes[$columna][$fila].'</a></td>';
            else
              echo '<td width="'.$medidas[$columna].'">'.$lista_clientes[$columna][$fila].'</td>';
          echo '</tr>';
        }
    }
?>