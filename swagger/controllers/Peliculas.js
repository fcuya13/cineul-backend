'use strict';

var utils = require('../utils/writer.js');
var Peliculas = require('../service/PeliculasService');

module.exports.peliculasGET = function peliculasGET (req, res, next, id) {
  Peliculas.peliculasGET(id)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
