const Utils = require("./utils");

function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(...this.pos, this.radius, 0, Math.PI * 2);
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.isWrappable = true;

MovingObject.prototype.move = function () {
  let newPos = [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];
  if (this.isWrappable) {
    this.pos = this.game.wrap(newPos);
  } else if (this.game.isOutOfBounds(newPos)) {
    this.game.remove(this);
  } else {
    this.pos = newPos;
  }
}

MovingObject.prototype.isCollidedWith = function (otherObject) {
  let distBetween = Utils.dist(this.pos, otherObject.pos);
  let sumOfRadii = this.radius + otherObject.radius;
  return sumOfRadii > distBetween; 
}

MovingObject.prototype.collideWith = function (otherObject) {
}

module.exports = MovingObject;