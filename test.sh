#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./halcc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 "5+20-4"
assert 41 "40 + 1 - 20 + 20"
assert 16 "4+3*4"
assert 12 "4*(9-6)"
assert 8 "(5+27)/4"

echo OK
