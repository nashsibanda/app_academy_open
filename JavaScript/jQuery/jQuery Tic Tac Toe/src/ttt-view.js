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
      const $square = $(this);
      const pos = $square.data("pos");
      console.log(pos)
      let squareClass = "marked marked-X";
      let squareMark = "X"
      if (that.game.currentPlayer === "o") {
        squareClass = "marked marked-O"
        squareMark = "O"
      }
      try {
        console.log(that.game.board)
        that.game.playMove(pos);
      } catch (error) {
        alert("This is an invalid move!");
        return
      }
      $square.addClass(squareClass);
      $square.append("<span>" + squareMark + "</span>");
    })
  }

  makeMove($square) {}

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
