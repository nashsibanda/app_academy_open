function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(...this.pos, this.radius, 0, Math.PI * 2);
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function () {
  let newPos = [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];
  this.pos = newPos;
}

module.exports = MovingObject;