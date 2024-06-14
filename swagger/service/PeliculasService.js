'use strict';


/**
 * Obtener información de películas
 * Obtiene información de una película por ID o de todas las películas
 *
 * id Integer ID de la película (optional)
 * returns inline_response_200_1
 **/
exports.peliculasGET = function(id) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "actores" : [ "actores", "actores" ],
  "funciones" : [ {
    "id" : 6,
    "time" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "id" : 6,
    "time" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "imagen_url" : "imagen_url",
  "generos" : [ "generos", "generos" ],
  "titulo" : "titulo",
  "id" : 0,
  "sinopsis" : "sinopsis",
  "trailer_url" : "trailer_url"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

