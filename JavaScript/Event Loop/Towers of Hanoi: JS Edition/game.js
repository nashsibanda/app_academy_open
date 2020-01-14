const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

class Game {
  constructor() {
    this.towers = [[1, 2, 3], [], []];
  }

  promptMove(callback) {
    console.log(`${JSON.stringify(this.towers)}\n`);
    reader.question("Pick a tower to remove first disc: ", function (startTowerIdx) {
      reader.question("Pick a tower to move disc to: ", function (endTowerIdx) {
        callback(startTowerIdx, endTowerIdx);
      })
    })
  }

}

let testCallback = function (startTowerIdx, endTowerIdx) {
  console.log(`Start tower index: ${startTowerIdx}. End tower index: ${endTowerIdx}`);
  reader.close();
}

let game = new Game();
game.promptMove(testCallback);

// until the game is solved
// get a move from player
// make move on towers