const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

function askIfGreaterThan(el1, el2, callback) {
  reader.question(
    `Is el1: ${el1} greater than el2: ${el2}? Please enter yes or no: `,
    function (response) {
      let greaterThan = (response === "yes" ? true : false);
      callback(greaterThan);
  });
};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  console.log(`In inner bubble sort. START. Array: ${arr}`)
  if (i < (arr.length - 1)) {
    askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan) {
      let madeAnySwaps = false;
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, (i + 1), madeAnySwaps, outerBubbleSortLoop);
      console.log(`\n In inner bubble sort. Made any swaps: ${madeAnySwaps}; array: ${arr}`);
    });
  } else if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function outerBubbleSortLoop(madeAnySwaps) {
  console.log(`In outer bubble sort. Made any swaps: ${madeAnySwaps}`);
  reader.close();
}

let testArr = [3, 2, 1, 4];

innerBubbleSortLoop(testArr, 0, undefined, outerBubbleSortLoop);

function absurdBubbleSort(arr, sortCompletionCallback) {
  

}