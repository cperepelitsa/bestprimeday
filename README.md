Purpose
=======

Amazon has created a faux holiday called "Prime Day."  
However, the dates chosen for each Prime Day seem to have little to do with prime numbers.
For example, Prime Day in 2016 was on 7/20, and on 7/14 in 2017, and neither of these
dates have anything particularly interestingly "prime" about them.

This program finds a "better" candidate date for a Prime Day in a given year by looking
for a date which yields the largest number of primes out of substrings of the date
formatted "YYYYMMDD".

Requirements
============

* ghc
* cabal-install
* make

Usage
=====

The default `make` target will compile the binary and move it to the
project root. Run it with `./bestPrimeDay <year>`:

    $ ./bestPrimeDay 2017
    2 dates have 11 primes in substrings:
    20170131: [2,2017,17,7,201701,701,7013,13,3,131,31]
    20170113: [2,2017,17,7,201701,701,17011,11,113,13,3]
