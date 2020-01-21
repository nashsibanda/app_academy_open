const Game = require("./game");
const GameView = require("./game_view");
window.GameView = GameView;
window.Game = Game;

window.addEventListener('DOMContentLoaded', (event) => {
  window.ctx = document.getElementById('game-canvas').getContext("2d");
  window.game = new Game();
  window.gview = new GameView(game, ctx);
  window.gview.start();
})
