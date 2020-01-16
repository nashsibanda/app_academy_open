class Board {
  constructor() {
    this.grid = [["", "", ""], ["", "", ""], ["", "", ""]];
    this.currentPlayer = "X";
  }

  print(){
    console.log(" ");
    console.log(this.grid[0]);
    console.log(this.grid[1]);
    console.log(this.grid[2]);
    console.log(" ");
    console.log(`Current Player: "${this.currentPlayer}"`);
  }

  reset() {
    this.grid = [["", "", ""], ["", "", ""], ["", "", ""]];
    this.currentPlayer = "X";
    return true;
  }

  switchPlayer() {
    if (this.currentPlayer === "X") {
      this.currentPlayer = "O";
    } else {
      this.currentPlayer = "X";
    }
  }

  won() {
    const fullRow = (row) => row.every(el => el === row[0] && el !== "");
    if (
      this.grid.some(fullRow)
      || this.columns()
      || this.diagonals()
    ) {
      return true
    } else {
      return false;
    }
  }

  columns() {
    for (let i = 0; i < this.grid.length; i++) {
      if (
        this.grid[0][i] === this.grid[1][i]
        && this.grid[0][i] === this.grid[2][i]
        && this.grid[0][i] !== ""
        ) {
        return true;
      }
    }
    return false;
  }

  diagonals() {
    if (this.grid[1][1] !== "") {
      if (
        this.grid[0][0] === this.grid[1][1]
        && this.grid[0][0] === this.grid[2][2]
      ) {
          return true;
      } else if (
          this.grid[0][2] === this.grid[1][1]
          && this.grid[0][2] === this.grid[2][0]
      ) {
        return true
      }
    }
    return false;
  }

  empty(pos) {
    const position = this.grid[pos[0]][pos[1]];
    return position === "";
  }

  promptMove(reader, callback) {
    this.print();
    const currentPlayer = this.currentPlayer;
    let board = this;
    reader.question(`Please choose a position to add a mark. \n For example, to choose row 0, position 2, enter "0 2" without quote marks. \n Type here: `, 
    function (response) {
      const pos = response.split(" ");
      callback(pos, currentPlayer);
    })
  }

  placeMark(pos, mark) {
    if (this.validPos(pos) && this.empty(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
      return true;
    } else {
      return false;
    }
  }

  validPos(pos) {
    return pos[0] >= 0
      && pos[0] < 3
      && pos[1] >= 0
      && pos[1] < 3;
  }

}

module.exports = Board;

// const board = new Board;
// // board.print();
// // board.placeMark([0,2], board.currentPlayer);
// board.promptMove(reader, board.placeMark)
// // board.print();
// // console.log(board.won());