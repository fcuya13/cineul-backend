'use strict';


/**
 * Crear usuario
 * Crea un nuevo usuario
 *
 * returns inline_response_404
 **/
exports.userCreatePOST = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 * Restablecer contraseña
 * Restablece la contraseña de un usuario
 *
 * returns inline_response_404
 **/
exports.userResetPOST = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 * Validar usuario
 * Valida un usuario mediante DNI y contraseña
 *
 * returns inline_response_200
 **/
exports.userValidatePOST = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "data" : "data",
  "message" : "message"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

