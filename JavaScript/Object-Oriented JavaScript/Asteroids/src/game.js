const Asteroid = require("./asteroid");

function Game () {
  this.asteroids = [];
  this.ship = [];
  this.bullets = [];
  this.addAsteroids();
}

Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 30;

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let newAsteroid = new Asteroid( {pos: this.randomPosition() } )
    this.asteroids.push(newAsteroid);
  }
}

Game.prototype.randomPosition = function () {
  let randX = Math.round(Math.random() * Game.DIM_X);
  let randY = Math.round(Math.random() * Game.DIM_Y);
  return [randX, randY]
}

Game.prototype.moveObjects = function () {
  for (let i = 0; i < this.asteroids.length; i++) {
    const element = this.asteroids[i];
    element.move();
  }
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  for (let i = 0; i < this.asteroids.length; i++) {
    const element = this.asteroids[i];
    element.draw(ctx);
  }
}


module.exports = Game;