#!/bin/bash

# Deberes I DevOps Continuo:

# 1. Crear un contenedor con MongoDB, protegido con usuario y contraseña, añadir una colección, crear un par de documentos y acceder a ella a través de MongoDB Compass.

#Localizar la imagen oficial de mongoDB e instalar MongoDB Compass

#Ir a la documentacion y leer como funciona
docker run -d --name some-mongo \

#/docker run/ (para descargar/iniciar cualquier imagen)
#/-d/ (para desatachar y no entrar en su modo consola, nos quedamos en la CLI de nuestro SO)
#/--name same-mongo/ (para asignar nombre al contenedor por convencion en la doc se utiliza some-mongo, en este caso lo utilizamos).

	#el flag /-p/ se referiere a los puertos que queremos exponer el standard es el 27017 que vamos a utilizar.
	-p 27017:27017 /
	#el flag /-e/ se refiere a las variales de entorno estas se usan para la identificacion(user y pas) y se crear por el admin y hacen de root. En este caso al ser un test vamos a usar el user y el pass de la doc. 
	-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
	-e MONGO_INITDB_ROOT_PASSWORD=secret \
	#Ahora ponemos el nombre de la imagen oficial que hemos buscado previamente en el hub si no queremos una version en concreto y queremos la ultima vale sin el (mongo):tag/lastet.
	mongo
#Si no tenemos la imagen, la descargara y nos dara un sha en el caso de que la tengamos descargada previamente nos dara el sha automaticamente.
#------------------------------------------------------------------------------#
# - Acceder a través del CLI para mongo y crear una colección llamada books con este formato {name: 'Kubernetes in Action', author: 'Marko Luksa'} en la base de datos test

#Nuevamente vemos en la doc que necesitamos para acceder a su consola /atacharnos/.


#/docker exec/(para entrar dentro de la consola)/el flag/-i/(para hacerlo interactivo y mantener STDIN abierto incluso si no esta conectado)/el flag/-t/asigna una consola (atachamos) a la que seria su cli admin./some-mongo mongo/(nombre del contenedor y de la imagen anteriormente creados). En la documentacion el siguiente paso seria conectarlo a una red,En este ejercicio obviamos ese paso que veremos mas adelante./-username mongoadmin --password secret/(al conectarnos a su cli admin necesitamos el user y pass para logearnos lo definiriamos de este modo aunque en la documentacion hay otros modos. 
docker exec -it some-mongo mongo --username mongoadmin --password secret

#Preguntamos en su CLI el nombre de la base de datos actual por defecto
db.getName()

#nos respondera que estas usando la "test":
use Library

#Ahora podemos introducir una nueva libreria e introducir datos en esta:

db.books.insert({
	name:'Kubernetes in Action',
	authot:'Marko Luksa'
})

#Deberia haber funcionado, si es asi nos indicara "WriteResult({ "nInserted" : 1 })"

#Para que nos muestre en pantalla la inserccion creada:

db.books.find({})

#Para salir de la CLI de mongo:

exit

#Para ver los logs 

docker logs some-mongo





