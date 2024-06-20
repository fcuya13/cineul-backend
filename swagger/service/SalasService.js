'use strict';


/**
 * Obtener información de salas
 * Obtiene información de todas las salas
 *
 * returns List
 **/
exports.salasGET = function(id) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] =  
  {
    "funciones" : [ 
      {
      "id" : 6,
      "time" : "2000-01-23T04:56:07.000+00:00"
    }, 
    {
      "id" : 6,
      "time" : "2000-01-23T04:56:07.000+00:00"
    } 
  ],
  "nombre_sala" : "nombre_sala",
  "direccion" : "direccion",
  "imagen_url" : "imagen_url",
  "id" : 0
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

