class Board {
  constructor() {
    this.grid = [["", "", ""], ["", "", ""], ["", "", ""]];
  }

  print(){
    console.log(this.grid[0]);
    console.log(this.grid[1]);
    console.log(this.grid[2]);
  }

}

const board = new Board;
board.print();