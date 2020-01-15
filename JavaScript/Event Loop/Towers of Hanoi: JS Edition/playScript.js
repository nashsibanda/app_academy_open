const Game = require('./game.js');

const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

const completionCallback = function (game) {
  reader.question("Would you like to play again? Please answer 'yes' or 'no': ",
  (response) => {
    const yesOrNo = (response === "yes" ? true : false);
    playAgain(yesOrNo, game);
  })
}

function playAgain (playAgain, game) {
  if (playAgain) {
    game.reset();
    game.run(reader, completionCallback);
  } else {
    console.log("Thanks for playing!");
    reader.close();
  }
}

const game = new Game();
game.run(reader, completionCallback);