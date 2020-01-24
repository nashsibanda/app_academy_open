const View = require("./ttt-view")
const Game = require("./game/game")

  $(() => {
    // Your code here
    window.container = $(".ttt")
    window.game = new Game();
    window.view = new View(game, container);
  });
