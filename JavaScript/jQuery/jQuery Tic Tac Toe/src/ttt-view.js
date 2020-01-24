class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const that = this;
    this.$el.on("click", "li", function () {
      that.makeMove($(this));
    });
  }

  makeMove($square) {
    const pos = $square.data("pos");
    let squareClass = "marked marked-X";
    let squareMark = "X"
    if (this.game.currentPlayer === "o") {
      squareClass = "marked marked-O"
      squareMark = "O"
    }
    try {
      this.game.playMove(pos);
    } catch (error) {
      alert("This is an invalid move!");
      return
    }    
    $square.addClass(squareClass);
    $square.append("<span>" + squareMark + "</span>");
    this.checkForWinner();
  }

  checkForWinner() {
    if (this.game.isOver()) {
      if (this.game.winner()) {
        this.win(this.game.winner())
      } else {
        $(".marked").addClass("game-draw");
        alert("It's a draw! Game Over!")
      }
      return true;
    } else {
      return false;
    }
  }

  win(winner) {
    switch (winner) {
      case "x":
        $(".marked-X").addClass("winner");
        alert("Player 'X' wins! Game Over!")
        break;
      case "o":
        $(".marked-O").addClass("winner");
        alert("Player 'O' wins! Game Over!")
      break;
    }
  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    $ul.addClass("grid");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li></li>");
        let pos = `[${i}, ${j}]`;
        $li.addClass("grid-square");
        $li.attr("data-pos", pos);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
