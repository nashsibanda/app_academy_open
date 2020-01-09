function madLib(verb, adjective, noun) {
  console.log(`We shall ` + verb.toUpperCase() + ` the ` + adjective.toUpperCase() + ` ` + noun.toUpperCase());
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  let output = [];
  array.forEach(element => {
    if (element % 3 === 0 && element % 5 != 0) {
      output.push(element);
    } else if (element % 5 === 0 && element % 3 != 0) {
      output.push(element);
    }
  });
  return output;
}

function isPrime(num) {
  if (num <= 1) {
    return false;
  } else if (num <= 3) {
    return true;
  }
  if (num % 2 === 0 || num % 3 === 0) {
    return false;
  }
  for (let i = 5; i*i <= num; i += 6) {
    if (num % i === 0 || num % (i + 2) === 0) {
      return false;
    }
  }
  return true;
}

function firstNPrimes(num) {
  let output = [];
  let i = 2;
  while (output.length < num) {
    if (isPrime(i)) {
      output.push(i);
    }
    i++
  }
  return output;
}

function sumOfPrimes(num) {
  sum = 0
  firstNPrimes(num).forEach(el => sum += el);
  return sum;
}