function merge(array1, array2) {
  const output = [];
  while (array1.length || array2.length) {
    const left = array1.length ? array1[0] : Infinity;
    const right = array2.length ? array2[0] : Infinity;

    if (left > right) {
      output.push(array2.shift());
    } else {
      output.push(array1.shift());
    }
  }
  return output;
}

function mergeSort(array) {
  if (array.length < 2) {
    return array;
  }

  const midPoint = Math.floor(array.length / 2);
  const leftArr = array.slice(0, midPoint);
  const rightArr = array.slice(midPoint);

  const sortedLeft = mergeSort(leftArr);
  const sortedRight = mergeSort(rightArr);

  return merge(sortedLeft, sortedRight);
}

module.exports = {
    merge,
    mergeSort
};