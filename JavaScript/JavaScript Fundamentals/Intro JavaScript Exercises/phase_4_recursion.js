function range(start, end) {
  if (start === end) {
    return [start];
  }
  return [start].concat(range((start + 1), end));
}

function sumRec(array) {
  if (array.length === 1) {
    return array[0];
  }
  return array[0] + sumRec(array.slice(1));
}

function exponent(base, exp) {
  if (exp === 0) {
    return 1
  } else if (exp == 1) {
    return base;
  }
  return base * exponent(base, (exp - 1));
}

function otherExponent(base, exp) {
  if (exp === 0) {
    return 1
  } else if (exp == 1) {
    return base;
  } else if (exp % 2 == 0) {
    return otherExponent(base, (exp / 2)) ** 2;
  } else if (exp % 2 == 1) {
    return base * (otherExponent(base, ((exp - 1) / 2)) ** 2);
  }
}

function fibonacci(n) {
  if (n === 1) {
    return [1]
  } else if (n === 2) {
    return [1, 1]
  }
  let next = fibonacci(n-1)
  return next.concat(next[next.length - 1] + next[next.length - 2]);
}

function deepDup(array) {
  let output = []
  for (let i = 0; i < array.length; i++) {
    let element = array[i];
    if (element instanceof Array) {
      element = deepDup(element);
    }
    output.push(element);
  }
  return output;
}

function bsearch(array, target, l = 0, r = (array.length - 1)) {
  let m = Math.floor((l + r) / 2);
  if (array[m] === target) {
    return m;
  } else if (l >= r) {
    return (-1);
  } else if (array[m] < target) {
    l = m + 1
    return bsearch(array, target, l, r)
  } else if (array[m] > target) {
    r = m - 1
    return bsearch(array, target, l, r)
  }
}

function mergeSort(array) {
  function merge(left, right) {
    let mergedArray = []
    while (left.length > 0 && right.length > 0) {
      if (left[0] < right[0]) {
        mergedArray.push(left.shift());
      } else {
        mergedArray.push(right.shift());
      }
    }
    return mergedArray.concat(left, right);
  }

  if (array.length < 2) {
    return array;
  } else {
    let m = Math.floor(array.length / 2);
    let leftArr = mergeSort(array.slice(0, m));
    let rightArr = mergeSort(array.slice(m));
    return merge(leftArr, rightArr);
  }
}

function subsets(array) {
  if (array.length === 0) {
    return [[]];
  }

  const first = array[0];
  const withoutFirst = subsets(array.slice(1));
  // remember, we don't want to mutate the subsets without the first element
  // hence, the 'concat'
  const withFirst = withoutFirst.map(sub => [first].concat(sub));

  return withoutFirst.concat(withFirst);
}
