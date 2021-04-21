// Write a function, stepper(nums), that takes in an array of non negative numbers.
// Each element of the array represents the maximum number of steps you can take from that position in the array.
// The function should return a boolean indicating if it is possible to travel from the 
// first position of the array to the last position.
//
// For Example:
//
// Given [3, 1, 0, 5, 10]
//      - We begin at first position, 3. 
//      - Since the element is 3 we can take up to 3 steps from this position.
//      - This means we can step to the 1, 0, or 5
//      - Say we step to 1
//      - Since the element is 1, now the only option is to take 1 step to land on 0
//      - etc...
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// stepper([3, 1, 0, 5, 10]);           // => true, because we can step through elements 3 -> 5 -> 10
// stepper([3, 4, 1, 0, 10]);           // => true, because we can step through elements 3 -> 4 -> 10
// stepper([2, 3, 1, 1, 0, 4, 7, 8])    // => false, there is no way to step to the end
function stepper(nums) {
  const table = Array(nums.length).fill(false);
  table[0] = true;

  for (let rootIdx = 0; rootIdx < table.length; rootIdx++) {
    if (table[rootIdx] === false) continue;
    const steps = nums[rootIdx];
    for (let step = 1; step <= steps; step++) {
      const reachableIndex = step + rootIdx;
      table[reachableIndex] = true;
    }
  }
  return table[table.length - 1];
}


// Write a function, maxNonAdjacentSum(nums), that takes in an array of nonnegative numbers.
// The function should return the maximum sum of elements in the array we can get if we cannot take
// adjacent elements into the sum.
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// maxNonAdjacentSum([2, 7, 9, 3, 4])   // => 15, because 2 + 9 + 4
// maxNonAdjacentSum([4,2,1,6])         // => 10, because 4 + 6 
function maxNonAdjacentSum(nums) {
  if (nums.length < 3) return Math.max(...nums, 0);
  const table = Array(nums.length);
  table[0] = nums[0];
  table[1] = nums[1];
  table[2] = Math.max(nums[2] + nums[0]);

  for (let stepIdx = 3; stepIdx < table.length; stepIdx++) {
    const num = nums[stepIdx];
    table[stepIdx] = Math.max(
      num + table[stepIdx - 2],
      num + table[stepIdx - 3]
    );
  }
  return Math.max(...table);
}


// Write a function, minChange(coins, amount), that accepts an array of coin values
// and a target amount as arguments. The method should the minimum number of coins needed
// to make the target amount. A coin value can be used multiple times.
//
// You've seen this problem before with memoization, but now solve it using the Tabulation strategy!
//
// Examples:
//
// minChange([1, 2, 5], 11)         // => 3, because 5 + 5 + 1 = 11
// minChange([1, 4, 5], 8))         // => 2, because 4 + 4 = 8
// minChange([1, 5, 10, 25], 15)    // => 2, because 10 + 5 = 15
// minChange([1, 5, 10, 25], 100)   // => 4, because 25 + 25 + 25 + 25 = 100
function minChange(coins, amount) {
  const table = Array(amount + 1);
  table[0] = 0;

  for (let i = 1; i <= amount; i++) {
    let remainders = [];
    for (const coin of coins) {
      if (coin > i) continue;
      remainders.push(i - coin);
    }
    remainders = remainders.map(x => 1 + table[x]);
    table[i] = Math.min(...remainders);
  }

  return table[amount];
}

module.exports = {
    stepper,
    maxNonAdjacentSum,
    minChange
};