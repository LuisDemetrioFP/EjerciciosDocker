#!/bin/bash

# 2. Servidor Nginx
#    - Crea un servidor Nginx llamado lemoncoders-web y copia el contenido de la carpeta lemoncoders-web en la ruta que sirve este servidor web.
#    - Ejecuta dentro del contenedor la acción ls, para comprobar que los archivos se han copiado correctamente.
#    - Hacer que el servidor web sea accesible desde el puerto 9999 de tu local.


#Con docker run --name creamos el contenedor y le ponemos el nombre -d para desatachar, -p para indicar el puerto y a continuacion el nombre de la imagen.
docker run --name lemoncode-web -d -p 9999:80 nginx

#para copiar es similar a bash le añadimos docker al principio y para copiar todos los archivos de la carpeta añadimos un /. despues de la carpeta a continuacion el nombre del contenedor y la direccion de la carpeta donde se alojan los archivos que arranca el servidor para mostrar en nuestra direccion de localhost:puerto.
docker cp folderlocal/foldelocal2/.../lemoncoders-web/. lemoncode-web:/usr/share/nginx/html

#usamos el comando exec y nombre del contenedor la instruccion (ls) y la direccion que queremos listar.
docker exec lemoncode-web ls /usr/share/nginx/html/

# o abrir la consola desde nuestra CLI con -it para salir facil con exit

docker exec -it lemoncode-web bash


