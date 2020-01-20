Function.prototype.inherits = function (parent) {
  // function Surrogate() {};
  // Surrogate.prototype = parent.prototype;
  // this.prototype = new Surrogate();
  // this.prototype.constructor = this;
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}

function MovingObject() {};

MovingObject.prototype.move = function () {
  console.log("I can moooooove!!!");
}

function Ship() {};
Ship.inherits(MovingObject);

Ship.prototype.fly = function () {
  console.log("I can flyyyyyy!!");
}

function Asteroid() {};
Asteroid.inherits(MovingObject);