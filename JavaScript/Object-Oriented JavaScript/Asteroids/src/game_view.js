function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
  this.ship = this.game.ship;
}

GameView.MOVES = {
  "w": [0, -1],
  "a": [-1, 0],
  "s": [0, 1],
  "d": [1, 0]
}

GameView.prototype.start = function () {
  this.bindKeyHandlers();
  const renderInterval = window.setInterval(this.render, 20);
}

GameView.prototype.render = function () {
  this.game.step();
  this.game.draw(this.ctx);
}

GameView.prototype.bindKeyHandlers = function () {
  const ship = this.ship;
  Object.keys(GameView.MOVES).forEach(key => {
    const dir = GameView.MOVES[key];
    global.key(key, function () { ship.power(dir); })
  });
  global.key("space", function () { ship.fireBullet(); })
}

module.exports = GameView;