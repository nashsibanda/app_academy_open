const HanoiGame = require("./game/game");
const HanoiView = require("./hanoi_view");

$(() => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});