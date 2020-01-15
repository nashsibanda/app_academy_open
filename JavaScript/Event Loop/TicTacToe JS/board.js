class Board {
  constructor() {
    this.grid = [["", "", ""], ["", "", ""], ["", "", ""]];
    this.current_player = "X"
  }

  print(){
    console.log(this.grid[0]);
    console.log(this.grid[1]);
    console.log(this.grid[2]);
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

  placeMark(pos, mark) {
    if (this.validPos(pos) && this.empty(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
    } else {
      console.log("This is not a valid move!")
    }
  }

  validPos(pos) {
    return pos[0] >= 0
      && pos[0] < 3
      && pos[1] >= 0
      && pos[1] < 3;
  }

}

const board = new Board;
board.print();
board.placeMark([0,3], "X");
board.print();
console.log(board.won());