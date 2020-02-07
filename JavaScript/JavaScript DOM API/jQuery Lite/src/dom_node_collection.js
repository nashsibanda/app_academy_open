class DOMNodeCollection {
  constructor(elementArray) {
    this.elementArray = elementArray;
  }

  html(string = null) {
    if (string === null) {
      return this.elementArray[0].innerHTML;
    } else {
      this.elementArray.forEach(element => {
        element.innerHTML = string;
      })
    }
  }
}

module.exports = DOMNodeCollection;