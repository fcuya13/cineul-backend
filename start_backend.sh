#!/bin/bash

# Ejecutar el archivo Ruby
ruby app.rb & 

# Iniciar el servidor Node.js
cd ./swagger 
npm start

# Esperar un segundo para asegurarse de que el servidor Node.js se inicie correctamente
sleep 1

