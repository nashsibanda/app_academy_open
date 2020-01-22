const Asteroid = require("./asteroid");
const Ship = require("./ship");
const Bullet = require("./bullet");

function Game () {
  this.asteroids = [];
  this.bullets = [];
  this.addAsteroids();
  this.addShip();
}

Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 10;

Game.prototype.addShip = function () {
  this.ship = new Ship({
    pos: this.randomPosition(),
    game: this
  })
}

Game.prototype.addBullet = function (bullet) {
  this.bullets.push(bullet);
}

Game.prototype.allObjects = function () {
  return this.asteroids.concat(this.ship, this.bullets);
}

Game.prototype.checkCollisions = function () {
  for (let i = 0; i < this.allObjects().length; i++) {
    const rootAst = this.allObjects()[i];
    for (let j = 0; j < this.allObjects().length; j++) {
      const compAst = this.allObjects()[j];
      if (rootAst !== compAst && rootAst.isCollidedWith(compAst)) {
        // console.log("Collision!");
        rootAst.collideWith(compAst);
      }
    }
  }
}

Game.prototype.remove = function (object) {
  if (object instanceof Bullet) {
    let arrIndex = this.bullets.indexOf(object);
    this.bullets.splice(arrIndex, 1);
  } else if (object instanceof Asteroid) {
    let arrIndex = this.asteroids.indexOf(object);
    this.asteroids.splice(arrIndex, 1);
  }
}

Game.prototype.step = function () {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let newAsteroid = new Asteroid( {
      pos: this.randomPosition(),
      game: this,
    } )
    this.asteroids.push(newAsteroid);
  }
}

Game.prototype.randomPosition = function () {
  let randX = Math.round(Math.random() * Game.DIM_X);
  let randY = Math.round(Math.random() * Game.DIM_Y);
  return [randX, randY]
}

Game.prototype.moveObjects = function () {
  for (let i = 0; i < this.allObjects().length; i++) {
    const element = this.allObjects()[i];
    element.move();
  }
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  for (let i = 0; i < this.allObjects().length; i++) {
    const element = this.allObjects()[i];
    element.draw(ctx);
  }
}

Game.prototype.wrap = function (pos) {
  let bleed = 30;
  if (pos[0] < (0 - bleed)) {
    return [(Game.DIM_X + bleed), pos[1]];
  } else if (pos[1] < (0 - bleed)) {
    return [pos[0], (Game.DIM_Y + bleed)];
  } else if (pos[0] > (Game.DIM_X + bleed)) {
    return [(0 - bleed), pos[1]];
  } else if (pos[1] > (Game.DIM_Y + bleed)) {
    return [pos[0], (0 - bleed)];
  } else {
    return pos;
  }
}

module.exports = Game;