const Game = require("./game");
const Asteroid = require("./asteroid");
const GameView = require("./game_view");
window.GameView = GameView;
window.Game = Game;
window.Asteroid = Asteroid;

window.addEventListener('DOMContentLoaded', (event) => {
  window.ctx = document.getElementById('game-canvas').getContext("2d");
  window.game = new Game();
  window.gview = new GameView(game, ctx);
  window.ast1 = new Asteroid ({pos: [100, 100], game: window.game });
  window.ast2 = new Asteroid({ pos: [140, 140], game: window.game, color: "#4b8d6c" });
  window.ast1.draw(window.ctx);
  window.ast2.draw(window.ctx);
  console.log(ast1.isCollidedWith(ast2))
  // window.gview.start();
})

