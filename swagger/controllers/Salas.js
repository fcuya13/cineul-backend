'use strict';

var utils = require('../utils/writer.js');
var Salas = require('../service/SalasService');

module.exports.salasGET = function salasGET (req, res, next) {
  Salas.salasGET()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
