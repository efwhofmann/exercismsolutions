BigInt square(final int n) {
  if(n<1 || n>64)
    throw ArgumentError('square must be between 1 and 64');
  return BigInt.one << n-1;
}

BigInt total() {
  return BigInt.two.pow(64) - BigInt.one;
}
