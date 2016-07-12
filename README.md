Purpose
=======

Amazon declared that 7/20/2016 is "Prime Day".

This program finds a "better" candidate date for a Prime Day by looking
for a date in 2016 which yields the largest number of primes out of
substrings of the date formatted "YYYYMMDD".

Requirements
============

* ghc
* cabal-install
* make

Usage
=====

The default `make` target will compile the binary and move it to the
project root. Run it with `./bestPrimeDay`:

	$ ./bestPrimeDay
	1 dates have 10 primes in substrings:
	20161013: [2,20161,61,2016101,6101,101,20161013,1013,13,3]

Alternatively, `make run` will do everything, but the output will
include cruft from dependency fetching and compilation.
