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

assert 10 '-10+20'
assert 10 '- -10'
assert 10 '- - +10'

assert 0 '0==1'
assert 1 '42==42'
assert 1 '0!=1'
assert 0 '42!=42'

assert 1 '0<1'
assert 0 '1<1'
assert 0 '2<1'
assert 1 '0<=1'
assert 1 '1<=1'
assert 0 '2<=1'

assert 1 '1>0'
assert 0 '1>1'
assert 0 '1>2'
assert 1 '1>=0'
assert 1 '1>=1'
assert 0 '1>=2'

echo OK
