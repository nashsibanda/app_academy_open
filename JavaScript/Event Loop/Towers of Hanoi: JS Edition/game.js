class Game {
  constructor() {
    this.towers = [[1, 2, 3], [], []];
  }

  promptMove(reader, callback) {
    this.print();
    reader.question("Pick a tower to remove first disc: ", function (start) {
      const startTowerIdx = parseInt(start);
      reader.question("Pick a tower to move disc to: ", function (end) {
        const endTowerIdx = parseInt(end);
        callback(startTowerIdx, endTowerIdx);
      })
    })
  }
  
  isValidMove(startTowerIdx, endTowerIdx) {
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    if (startTower.length === 0) {
      return false
    } else if (endTower.length === 0 ||
      startTower[0] < endTower[0]) {
      return true;
    } else {
      return false;
    }
  }
    
  move(startTowerIdx, endTowerIdx) {
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      endTower.unshift(startTower.shift());
      return true;
    } else {
      return false;
    }
  }

  print() {
    console.log(`${JSON.stringify(this.towers)}\n`);
  }

  isWon() {
    return (this.towers[1].length == 3 || this.towers[2].length == 3)
  }

  run (completionCallback) {
    this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log("This is not a valid move");
      }

      if (this.isWon()) {
        this.print();
        console.log("Game complete!")
        completionCallback(startTowerIdx, endTowerIdx);
      } else {
        this.run(completionCallback);
      }
    })
  }

}

module.exports = Game;

// let testCallback = function (startTowerIdx, endTowerIdx) {
//   console.log(`Start tower index: ${startTowerIdx}. End tower index: ${endTowerIdx}`);
//   reader.close();
// }



// let game = new Game();
// game.promptMove(reader, game.move.bind(game));
// console.log(game.isWon());
// game.run(testCallback);

// until the game is solved
// get a move from player
// make move on towers