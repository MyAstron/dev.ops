```php
            <script>
              var xhttp = new XMLHttpRequest();
              let lista = JSON.parse('<?php $json_datos ?>')
              Object.keys(lista).forEach(function(clave) {
                console.log(lista[clave]);
              })
              /* filtro */
              let areglo, filtro = 
              {
                /* clave: asignacion */
                "Organizacion": <?php $unidad_organizacional?>,
                "Departamentos": <?php $departamentos?>,
                "Centro de Costo": <?php $centro_costos?>,
                "Sub-Centro de Costo": <?php $sub_centro?>,
                "Nombre": <?php $nombres?>,
                "Correo": <?php $correo?>,
                "Extencion": <?php $extencion?>,
                "Celular": <?php $cel?>,
                "": "none"
              };
              xhttp.open("POST", "./", true);
              Object.keys(filtro).forEach(function(clave) {
                xhttp.send("clave=", JSON.stringify(clave))
                  <?php 
                    $clave = json_decode($_POST["clave"]);
                          foreach($clave as $elemento){
                            echo '<option>'.$elemento.'</option>';
                          }
                  ?>
              })
            </script>
```

# SQL Cloud

**Host**:
```
bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com <br>
```
**Data Base**:
```
bbxmjoirzhsluxd30dpi <br>
```
**User**:
```
uvbcbackgnxzcdke <br>
```
**Password**:
```
ygjWzMX06wph8h5x6NR0 <br>
```
**Port**:
```
3306 <br>
```
**Conection URL**:
```
mysql://uvbcbackgnxzcdke:ygjWzMX06wph8h5x6NR0@bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com:3306/bbxmjoirzhsluxd30dpi <br>
```
**MySQL CLI**:
```
mysql -h bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com -P 3306 -u uvbcbackgnxzcdke -p bbxmjoirzhsluxd30dpi<br>
```