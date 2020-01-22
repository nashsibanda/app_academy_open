const Utils = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Ship = require("./ship");
const Bullet = require("./bullet")

const DEFAULTS = {
  COLOR: "#554935",
  RADIUS: 30,
  SPEED: 3
}

function Asteroid(options) {
  options = options || {};
  options.color = options.color || DEFAULTS.COLOR;
  options.radius = DEFAULTS.RADIUS;
  options.pos = options.pos;
  options.vel = Utils.randomVec(DEFAULTS.SPEED);
  options.game = options.game

  MovingObject.call(this, options);
}
Utils.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  } else if (otherObject instanceof Bullet) {
    this.game.remove(otherObject);
    this.game.remove(this);
  }
}



module.exports = Asteroid;