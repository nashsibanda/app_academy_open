function curriedSum(numOfArgs) {
  numbers = [];
  const _curriedSum = function (number) {
    numbers.push(number);

    if (numbers.length === numOfArgs) {
      return numbers.reduce( (acc, curr) => acc + curr, 0);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1));