const Game = require("./game");
const Asteroid = require("./asteroid");
const GameView = require("./game_view");
window.GameView = GameView;
window.Game = Game;
window.Asteroid = Asteroid;

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('game-canvas');
  canvas.width = Game.DIM_X;
  canvas.height = Game.DIM_Y;
  
  window.ctx = canvas.getContext("2d");
  window.game = new Game();
  window.gview = new GameView(game, ctx);
  window.gview.start();
})

