// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

function minPathSum(grid) {
  var table = new Array(grid.length)
    .fill([])
    .map(x => new Array(grid[0].length).fill(Infinity));
  table[0][0] = grid[0][0];
  
  for (var row = 0; row < table.length; row++) {
    for (var col = 0; col < table[0].length; col++) {
      const pos = table[row][col];
      if (table.length > row + 1) {
        table[row + 1][col] = Math.min(table[row + 1][col], pos + grid[row + 1][col]);
      }
      if (table[0].length > col + 1) {
        table[row][col + 1] = Math.min(table[row][col + 1], pos + grid[row][col + 1]);
      }
    }
  }
  return table[table.length - 1][table[0].length - 1];
}

console.log(
  minPathSum([
    [1, 2, 3],
    [4, 5, 6],
  ])
);