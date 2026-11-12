# Sistema Bibliotecario Interno FCA UV — Base de datos

Repositorio que contiene la estructura de la base de datos MySQL del Sistema Bibliotecario Interno de la Facultad de Contaduría y Administración de la Universidad Veracruzana.

## Contenido

- `biblioteca_estructura.sql`: estructura de la base de datos, tablas, claves primarias, índices y relaciones entre tablas.

## Requisitos

- MySQL 8.0 o superior (se recomienda verificar la compatibilidad de la intercalación utilizada).
- MySQL Workbench u otra herramienta para administrar bases de datos MySQL.

## Importación

1. Crear una base de datos de prueba llamada `biblioteca`.
2. Abrir el archivo `biblioteca_estructura.sql` desde MySQL Workbench.
3. Ejecutar el script para crear las tablas y relaciones.

**Importante:** El script contiene instrucciones `DROP TABLE IF EXISTS`. Ejecutarlo sobre una base de datos existente puede eliminar tablas y reemplazar su estructura. Se recomienda realizar una copia de seguridad antes de importarlo.

## Notas

Este archivo contiene la estructura de la base de datos, no registros de información.

Proyecto desarrollado con Angular, Java Spring Boot y MySQL.
