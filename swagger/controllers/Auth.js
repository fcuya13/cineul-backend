'use strict';

var utils = require('../utils/writer.js');
var Auth = require('../service/AuthService');

module.exports.userCreatePOST = function userCreatePOST (req, res, next) {
  Auth.userCreatePOST()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.userResetPOST = function userResetPOST (req, res, next) {
  Auth.userResetPOST()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.userValidatePOST = function userValidatePOST (req, res, next) {
  Auth.userValidatePOST()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
