#Aqui defino la imagen base que voy a usar para mi contenedor.
#En este caso, estoy usando la imagen oficial de python 3.7.11-slim
FROM python:3.7.11-slim

#Con WORKDIR defino el directorio de trabajo que se va a usar para las siguientes instrucciones
#Si el directorio no existe, lo crea
#En este caso estoy definiendo que el directorio de trabajo va a ser /python-api
WORKDIR  /python-api

#COPY copio el archivo requirements.txt o el archivo que yo quiera copiar al contenedor
#el primer espacio seria el archivo o directorio que quiero copiar 
#el segundo seria el destino donde lo quiero copiar dentro del contenedor
#En este caso estoy copiando el archivo requirements.txt al directorio de trabajo del contenedor
COPY requirements.txt requirements.txt

#RUN ejecuta un comando en la terminal del contenedor, en este caso
#El comando que le estoy diciendo que se ejecute es pip install -r requirements.txt para las dependencias
RUN pip install -r requirements.txt

#COPY copia todo el contenido del directorio actual (.) al directorio de trabajo del contenedor (/python-api)
COPY . .

#CMD define el comando que se va a ejecutar cuando el contenedor se inicie
#En este caso, le estoy diciendo que inicie la aplicacion de flask cuando el contenedor se inicie en el host
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
