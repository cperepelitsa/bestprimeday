SANDBOX = .cabal-sandbox

.PHONY: bestPrimeDay sandbox run

bestPrimeDay: $(SANDBOX)
	cabal build
	mv dist/build/bestPrimeDay/bestPrimeDay .

$(SANDBOX):
	cabal sandbox init
	cabal install

run: $(SANDBOX)
	cabal run
