// Work through this problem on https://leetcode.com/problems/climbing-stairs/ and use the specs given there.
// Feel free to use this file for scratch work.

function climbStairs(n) {
  let table = Array(n + 1);
  table[0] = 1;
  table[1] = 1;

  for (let i = 2; i <= n; i++) {
    table[i] = table[i - 1] + table[i - 2];
  }

  return table[n];
}

console.log(climbStairs(2))
console.log(climbStairs(3))
console.log(climbStairs(4))