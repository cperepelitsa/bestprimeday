SANDBOX = .cabal-sandbox

.PHONY: bestPrimeDay sandbox run clean

bestPrimeDay: $(SANDBOX)
	cabal build
	mv dist/build/bestPrimeDay/bestPrimeDay .

$(SANDBOX):
	cabal sandbox init
	cabal install

clean:
	rm -rf .cabal-sandbox bestPrimeDay cabal.sandbox.config dist
