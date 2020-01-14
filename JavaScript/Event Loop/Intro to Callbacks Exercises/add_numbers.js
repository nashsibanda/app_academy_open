const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function addNumbers(sumParam, numsLeftParam, completionCallback) {
  let sum = sumParam;
  let numsLeft = numsLeftParam;
  if (numsLeft > 0) {
    reader.question("Please enter a number:", function (numStr) {
      let num = Number.parseInt(numStr);
      sum += num;
      numsLeft--;
      console.log(`You entered: ${num}.`);
      addNumbers(sum, numsLeft, completionCallback);
    })
  } else if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));