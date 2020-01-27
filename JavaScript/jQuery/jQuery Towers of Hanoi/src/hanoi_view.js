class View {
  constructor(game, rootEl) {
    this.game = game;
    this.$element = rootEl;
    this.firstTower = null;
    this.setupTowers();
    this.render();
    this.addClickListener();
  }

  setupTowers() {
    let towerSize = this.game.towers[0].length;
    for (let i = 0; i < towerSize; i++) {
      let $ul = $("<ul></ul>");
      $ul.addClass(`tower tower-${i}`);
      $ul.attr("tower-num", i)
      this.$element.append($ul);
    }
  }

  render() {
    $(".tower").empty();
    for (let i = 0; i < this.game.towers.length; i++) {
      for (let j = 0; j < this.game.towers[i].length; j++) {
        let disc = this.game.towers[i][j];
        if (disc) {
          let $li = $("<li></li>");
          $li.addClass(`disc disc-${disc}`);
          $(`.tower-${i}`).append($li);
        }
      }
    }
  }

  addClickListener() {
    const view = this;
    view.$element.on("click", ".tower", event => {
      if (view.firstTower === null) {
        view.firstTower = $(event.currentTarget).attr("tower-num");
        $(`.tower-${view.firstTower}`).addClass("selected-tower");
      } else {
        if (view.firstTower === $(event.currentTarget).attr("tower-num")) {
          $(event.currentTarget).removeClass("selected-tower");
          view.firstTower = null;
        } else {
          let secondTower = $(event.currentTarget).attr("tower-num");
          if (view.game.move(view.firstTower, secondTower)) {
            $(".tower").removeClass("selected-tower");
            view.firstTower = null;
          } else {
            alert(`Invalid move! Tower ${Number.parseInt(view.firstTower) + 1} is still selected.`);
          }
        }
      }
      view.render();
      view.checkIfWon();
    });
  }

  checkIfWon() {
    if (this.game.isWon()) {
      alert("You win!")
    }
  }

  
}

module.exports = View;