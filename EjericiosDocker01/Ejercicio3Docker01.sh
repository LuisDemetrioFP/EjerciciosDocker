#!/bin/bash

#el comando bash de rm para eliminar -f para forzar y que no pregunte por cada contenedor que queramos eliminar $(docker ps -aq) de la lista de docker todos los contenedores los que estan activos y los que no -a y solo mostrar los IDs cuando los eliminemos -q.


docker rm -f &(docker ps -aq)


exit

