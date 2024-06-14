'use strict';


/**
 * Obtener información de salas
 * Obtiene información de todas las salas
 *
 * returns List
 **/
exports.salasGET = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = [ {
  "direccion" : "direccion",
  "imagen_url" : "imagen_url",
  "id" : 0,
  "nombre" : "nombre"
}, {
  "direccion" : "direccion",
  "imagen_url" : "imagen_url",
  "id" : 0,
  "nombre" : "nombre"
} ];
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

