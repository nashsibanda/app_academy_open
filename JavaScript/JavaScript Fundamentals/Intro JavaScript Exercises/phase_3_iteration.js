Array.prototype.bubbleSort = function () {
  let sorted = false;
  let arr = [...this];
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < (arr.length - 1); i++) {
      if (arr[i] > arr[i+1]) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        sorted = false;
      }
    }
  }
  return arr;
};

String.prototype.substrings = function () {
  let output = [];
  let str = this;
  for (let i = 0; i < str.length; i++) {
    for (let j = (i+1); j <= str.length; j++) {
      output.push(str.slice(i, j))
    }
  }
  return output;
}