function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(...this.pos, this.radius, 0, Math.PI * 2);
  ctx.fill();
}

MovingObject.prototype.move = function (ctx) {
  let newPos = [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];
  ctx.clearRect(0,0,ctx.canvas.width,ctx.canvas.height);
  ctx.beginPath();
  ctx.arc(...newPos, this.radius, 0, Math.PI * 2);
  ctx.fill();
}

module.exports = MovingObject;