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
Utils.inherits(Ship, MovingObject)

const DEFAULTS = {
  COLOR: "#4e85b0",
  RADIUS: 10
}

Ship.prototype.relocate = function () {
  console.log("Relocating...");
  this.pos = this.game.randomPosition();
  this.vel = [0, 0];
}

Ship.prototype.power = function (impulse) {
  this.vel = [(this.vel[0] + impulse[0]), (this.vel[1] + impulse[1])];
}


module.exports = Ship;