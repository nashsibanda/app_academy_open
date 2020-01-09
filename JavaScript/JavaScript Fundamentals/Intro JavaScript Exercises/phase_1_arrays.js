Array.prototype.uniq = function () {
  let output = [];
  this.forEach(function (el) {
    if (!output.includes(el)) {
      output.push(el);
    };
  })
  return output;
};

Array.prototype.twoSum = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    const rootElement = this[i];
    for (let j = i; j < this.length; j++) {
      const sumElement = this[j];
      if (rootElement + sumElement === 0) {
        output.push([i, j])
      }
    }
  }
  return output;
}

Array.prototype.transpose = function () {
  let output = [];
  for (let i = 0; i < this[0].length; i++) {
    const transArray = this[i];
    output.push([])
    for (let j = 0; j < this.length; j++) {
      const transElement = this[j][i];
      output[i].push(transElement)
    }
  }
  return output;
}