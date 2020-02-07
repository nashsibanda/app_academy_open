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

  empty() {
    this.elementArray.forEach(element => {
      element.innerHTML = "";
    })
  }

  append(child) {
    if (child instanceof HTMLElement) {
     this.elementArray.forEach(element => {
       element.innerHTML = element.innerHTML + child.outerHTML;
      });
    } else if (typeof child === "string") {
      this.elementArray.forEach(element => {
        element.innerHTML = element.innerHTML + child;
      });
    } else if (typeof child.elementArray[Symbol.iterator] === "function") {
      this.elementArray.forEach(element => {
        child.elementArray.forEach(childElement => {
          element.innerHTML = element.innerHTML + childElement.outerHTML;
        });
      })
    }
  }

  attr(attribute, value = null) {
    if (value === null) {
      return this.elementArray[0].getAttribute(attribute);
    } else {
      this.elementArray.forEach(element => {
        element.setAttribute(attribute, value);
      })
    }
  }

  addClass(className) {
    this.elementArray.forEach(element => {
      element.classList.add(className);
    })
  }

  removeClass(className) {
    this.elementArray.forEach(element => {
      element.classList.remove(className);
    })
  }

  // Traversal

  children() {
    const childrenArray = [];
    this.elementArray.forEach(element => {
      const elementChildren = Array.from(element.children);
      childrenArray.push(...elementChildren);
    })
    return new DOMNodeCollection(childrenArray);
  }

  parent() {
    const parentArray = [];
    this.elementArray.forEach(element => {
      if (!parentArray.includes(element.parentNode)) {
        parentArray.push(element.parentNode);
      }
    });
    return new DOMNodeCollection(parentArray);
  }

  find(selector) {
    const subCollection = [];
    this.elementArray.forEach(element => {
      const subNodeCollection = Array.from(element.querySelectorAll(selector));
      subCollection.push(...subNodeCollection);
    })
    return new DOMNodeCollection(subCollection);
  }

  remove() {
    this.elementArray.forEach(element => {
      element.outerHTML = "";
    })
  }
}

module.exports = DOMNodeCollection;