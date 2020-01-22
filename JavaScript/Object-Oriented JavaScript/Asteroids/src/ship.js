const Utils = require("./utils.js");
const MovingObject = require("./moving_object");
const Bullet = require("./bullet");

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

Ship.prototype.fireBullet = function () {
  
  const shipVel = this.vel;
  function bulletVel() {
    let newVel = [0, 0]
    if (shipVel[0] > 0) {
      newVel[0] = Math.max(8, (shipVel[0] * 1.5) );
    } else if (shipVel[0] < 0) {
      newVel[0] = Math.min(-8, (shipVel[0] * 1.5));
    }
    if (shipVel[1] > 0) {
      newVel[1] = Math.max(8, (shipVel[1] * 1.5) );
    } else if (shipVel[1] < 0) {
      newVel[1] = Math.min(-8, (shipVel[1] * 1.5));
    }
    return newVel;
  }
  const bulletOptions = {
    pos: this.pos,
    vel: bulletVel(),
    game: this.game
  }
  const bullet = new Bullet (bulletOptions);
  this.game.addBullet(bullet);
}


module.exports = Ship;