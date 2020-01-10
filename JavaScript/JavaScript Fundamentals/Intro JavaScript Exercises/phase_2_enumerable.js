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

Array.prototype.myReduce = function (callback, initialValue) {
  let arr = this;
  if (initialValue === undefined) {
    initialValue = arr[0]
    arr = arr.slice(1);
  }
  let output = initialValue;
  arr.myEach(ele => {
    output = callback(output, ele);
  });
  return output;
}