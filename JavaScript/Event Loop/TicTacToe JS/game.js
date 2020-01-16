const Board = require("./board.js")

class Game {
  constructor(reader) {
    this.board = new Board;
    this.reader = reader;
  }

  won() {
    return this.board.won();
  }

  nextTurn() {
    this.board.switchPlayer();
  }

  reset() {
    this.board.reset();
  }

  run(completionCallback) {
    this.board.promptMove(this.reader, (pos, currentPlayer) => {
      if (!this.board.placeMark(pos, currentPlayer)) {
        console.log("This is not a valid move");
        this.run(completionCallback);
      } else if (this.won()) {
        this.board.print();
        console.log("Game complete!")
        console.log(`Winner is "${this.board.currentPlayer}"!`)
        completionCallback(this);
      } else {
        this.nextTurn();
        this.run(completionCallback);
      }
    })
  }
}

module.exports = Game;