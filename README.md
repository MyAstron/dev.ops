# 🌐 Prácticas de Desarrollo Web Backend (dev.ops)

[![Ver Sitio en Vivo](https://img.shields.io/badge/ENTREGA-Drive-brightgreen?style=for-the-badge&logo=googledrive&logoColor=white)](https://drive.google.com/drive/folders/1KWodwbo_Oe6FUkRYekmSpHfTS6bM0N1u)
[![PHP](https://img.shields.io/badge/Language-PHP-777bb4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

Este repositorio contiene una colección de ejercicios y prácticas desarrolladas durante mis estudios de bachillerato. El enfoque principal fue aprender la integración entre aplicaciones web y bases de datos relacionales.

> **Nota Académica:** Este proyecto es una continuación de mis prácticas escolares para el aprendizaje de sistemas dinámicos.<br>
> **Entrega Final**: Los archivos finales de este proceso de aprendizaje, incluyendo documentación adicional y respaldos, fueron publicados y entregados oficialmente en el siguiente portafolio de evidencias: [Portafolio de Prácticas - Google Drive](https://drive.google.com/drive/folders/1KWodwbo_Oe6FUkRYekmSpHfTS6bM0N1u).
---

## 🛠️ Tecnologías y Herramientas
* **Frontend:** HTML5, CSS3 y JavaScript (AJAX/XMLHttpRequest).
* **Backend:** PHP para la lógica del servidor y conexión.
* **Base de Datos:** MySQL (con scripts de creación como `Ventas2015.sql`).
* **Cloud:** Pruebas de conexión remota mediante Clever Cloud.

## ⚙️ Funcionamiento y Estructura
El proyecto se centra en la gestión de datos y comunicación asíncrona:

1. **Conectividad:** Archivos como `conection.php` y `conect.php` gestionan el enlace entre el servidor PHP y la base de datos MySQL.
2. **Listados Dinámicos:** Uso de PHP para consultar registros y mostrarlos en el navegador (`listadoo.php`).
3. **Interacción con JS:** Implementación de filtrado dinámico mediante scripts que procesan archivos JSON y realizan peticiones `POST` al servidor.
4. **Base de Datos:** Incluye el esquema `Ventas2015.sql`, que sirve como base para las prácticas de consultas (SELECT), inserciones y filtros.

## 📂 Archivos Principales
* **`index.php`**: Punto de entrada principal de la aplicación.
* **`Ventas2015.sql`**: Script de base de datos para pruebas de ventas y productos.
* **`style.css`**: Estilos básicos para la presentación de los listados.
* **`Practicas(borrador).php`**: Archivo de experimentación y lógica preliminar.

---

## 📅 Información del Proyecto
* **Autor:** Cristopher (MyAstron).
* **Propósito:** Portafolio Académico / Prácticas de IGER.
* **Última Actualización:** 2022 (Cierre de ciclo escolar).

---
*Desarrollado con el fin de comprender la arquitectura cliente-servidor.*
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
bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com
```
**Data Base**:
```
bbxmjoirzhsluxd30dpi
```
**User**:
```
uvbcbackgnxzcdke
```
**Password**:
```
ygjWzMX06wph8h5x6NR0
```
**Port**:
```
3306
```
**Conection URL**:
```
mysql://uvbcbackgnxzcdke:ygjWzMX06wph8h5x6NR0@bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com:3306/bbxmjoirzhsluxd30dpi
```
**MySQL CLI**:
```
mysql -h bbxmjoirzhsluxd30dpi-mysql.services.clever-cloud.com -P 3306 -u uvbcbackgnxzcdke -p bbxmjoirzhsluxd30dp
```
