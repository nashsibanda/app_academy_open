Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    const element = this[i];
    callback(element);
  }
}

Array.prototype.myMap = function (callback) {
  let output = [];
  this.myEach(ele => output.push(callback(ele)));
  return output;
}