Portal de co-creación Web
==================

La carpeta ```portal-co-creacion-project``` es el proyecto en eclipse. 
Este proyecto utiliza Basex 8.3, Tomcat 8, Java 1.8

## Inicio 
* El proyecto requiere un servidor Tomcat para cargar el archivo war, para modificarlo es necesario importar el proyecto ```portal-co-creacion-project``` en eclipse o importar archivo war. 
* Generar el ```.war``` luego de las modificaciones. En eclipse ```Files > Export > war ```
* La descripción del modelo y diccionario de datos se encuentra en la carpeta [Model-Dictionary](/Model-Dictionary)

## Manejo de sesión
* [Session Module](http://docs.basex.org/wiki/Session_Module)
* Variable de sesión creada 'user'
	* Sesión creada: tiene el valor del nombre del usuarios
	* Sesión invalida: tiene el valor de 'inactive' 

## Enlaces de interes y aclaraciones
* El conteo y la posición de los elementos inicia desde “1”.
* [Integrar CSS con XSLTforms](https://en.wikibooks.org/wiki/XRX/XSLTForms_and_eXist#Modifying_your_CSS_to_work_with_XSLTForms)
* [Obtener fecha actual con baseX, función Xquery - ```current-dateTime()```](http://www.w3.org/TR/xpath-functions-30/)
* Para evitar problemas interpretando javascript agregar ```<![CDATA[ … codigo ..  ]]>```
* [Generar un war a partir de un proyecto desplegado en Tomcat](http://stackoverflow.com/questions/5109112/how-to-deploy-a-war-file-in-tomcat-7])

## Funcionalidades  
##### Cuentas
* Login
* Cerrar sesión 
* Registro usuarios
* Actualizar datos de usuarios

##### Problemas y soluciones 
* Crear problema
* Valorar problema
* Proponer Solucion
* Valorar Solucion
* Listar problemas y soluciones
* Buscar problemas y soluciones

##### Administración
* Borrar Problemas
* Borrar Soluciones
* Bloquear usuarios
* Enviar mensaje a todos los usuarios

# Servicios REST 

| Funcionalidad                      | Path                                  | Verbos Aceptados |
|------------------------------------|---------------------------------------|------------------|
| - Login                            | /login                                | POST             |
| - Logout                           | /logout                               | GET              |
| - Register                         | /register                             | POST             |
| - Obtener datos del usuario actual | /user                                 | GET              |
| - Actualizar Datos                 | /profile/{$user}                      | POST             |
| - Cerrar Cuenta                    | /profile/{$user}                      | DELETE           |
| - Crear problema                   | /problem                              | POST             |
| - Obtener problema                 | /problem/{$id}                        | GET              |
| - Valorar problema                 | /problem/{$id}/review                 | POST             |
| - Crear solución                  | /problem/{$id}/solution/              | POST             |
| - Modificar y obtener Solución    | /problem/{$id}/solution/{$sid}        | GET,  PUT        |
| - Valorar Solución                | /problem/{$id}/solution/{$sid}/review | GET, POST, PUT   |
| - Home Page                        | /home                                 | GET              |
| - Listar Problemas y Soluciones    | /problems/{criterios de b煤squeda}    | GET              |
| - Buscar Problemas y Soluciones    | /search                               | POST             |
| - Borrar Problemas                 | /problem/{$id}                        | DELETE           |
| - Borrar Soluciones                | /problem/{$id}/solution/{$sid}        | DELETE           |

## Colaboradores  
* -
* -
* -

