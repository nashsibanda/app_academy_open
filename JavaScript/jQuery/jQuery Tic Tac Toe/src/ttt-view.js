class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $ul = $("<ul></ul>");
    $ul.addClass("grid");
    for (let i = 0; i < 9; i++) {
      let $li = $("<li></li>");
      $li.addClass("grid-square");
      $ul.append($li);
    }
    this.$el.append($ul);
  }
}

module.exports = View;
