const isPrime = num => {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i == 0) {
      return false;
    }
  }

  return true;
};

const firstNPrimes = n => {
  let primes = [];

  for (let i = 2; primes.length < n; i++) {
    console.log(i);
    if (isPrime(i)) {
      primes.push(i);
    }
  }
  return primes;
};

console.log(firstNPrimes(15));
