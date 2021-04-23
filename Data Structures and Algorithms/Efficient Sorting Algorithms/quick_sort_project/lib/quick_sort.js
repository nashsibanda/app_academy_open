function quickSort(array) {
  if (array.length < 2) {
    return array;
  }

  const pivot = array.shift();
  const leftArr = array.filter(el => el < pivot);
  const rightArr = array.filter(el => el >= pivot);

  const sortedLeft = quickSort(leftArr);
  const sortedRight = quickSort(rightArr);

  return [...sortedLeft, pivot, ...sortedRight];
}


module.exports = {
    quickSort
};