const Utils = require("./utils.js");
const MovingObject = require("./moving_object");

function Ship(options) {
  options = options || {};
  options.color = options.color || DEFAULTS.COLOR;
  options.radius = options.radius || DEFAULTS.RADIUS;
  options.pos = options.pos;
  options.vel = [0, 0];
  options.game = options.game;

  MovingObject.call(this, options);
}

const DEFAULTS = {
  COLOR: "#4e85b0",
  RADIUS: 10
}

Utils.inherits(Ship, MovingObject)

module.exports = Ship;