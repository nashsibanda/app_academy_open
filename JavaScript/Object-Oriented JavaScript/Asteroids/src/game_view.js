const Game = require("./game");

function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function () {
  // let that = this;
  const renderInterval = window.setInterval(this.render, 20);
}

GameView.prototype.render = function () {
  console.log("Iterating...")
  this.game.step();
  this.game.draw(this.ctx);
}

module.exports = GameView;