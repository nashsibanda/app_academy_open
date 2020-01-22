const Utils = require("./utils");
const MovingObject = require("./moving_object");

function Bullet(options) {
  options = options || {};
  options.pos = options.pos;
  options.vel = options.vel;
  options.color = options.color || DEFAULTS.COLOR;
  options.radius = options.radius || DEFAULTS.RADIUS;
  options.game = options.game;

  MovingObject.call(this, options);
}
Utils.inherits(Bullet, MovingObject)

Bullet.prototype.isWrappable = false;


const DEFAULTS = {
  COLOR: "#aaaaaa",
  RADIUS: 2
}

module.exports = Bullet;