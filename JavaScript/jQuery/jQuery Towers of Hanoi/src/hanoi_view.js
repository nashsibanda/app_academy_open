class View {
  constructor(game, rootEl) {
    this.game = game;
    this.$element = rootEl;
    this.setupTowers();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let $ul = $("<ul></ul>");
      $ul.addClass(`tower-${i}`);
      for (let j = 0; j < 3; j++) {
        let $li = $("<li></li>");
        $ul.append($li);
      }
      this.$element.append($ul);
    }
  }
}

module.exports = View;