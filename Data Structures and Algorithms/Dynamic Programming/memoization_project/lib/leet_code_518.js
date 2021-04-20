// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

// Solution from a/A course
function change(amount, coins, memo={}) {
  let key = amount + '-' + coins;
  if (key in memo) return memo[key];
  if (amount === 0) return 1;
  
  let currentCoin = coins[coins.length - 1];
  let totalWays = 0;
  for (let qty = 0; qty * currentCoin <= amount; qty++) {
    totalWays += change(amount - qty * currentCoin, coins.slice(0, -1), memo);
  }

  memo[key] = totalWays;
  return memo[key];
}

console.log(change(500, [3,5,7,8,9,10,11])) 
