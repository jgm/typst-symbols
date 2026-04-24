build:
	cabal build
.PHONY: build

update-symbols: src/Typst/Symbols.hs
	rm Symbols.hs Shorthands.hs Emoji.hs
.PHONY: update-symbols

Symbols.hs:
	cabal run scrape-symbols.hs sym | sed -e 's/^/  /' >> $@
.PHONY: Symbols.hs

Shorthands.hs:
	cabal run scrape-symbols.hs | sed -e 's/^/  /' >> $@
.PHONY: Shorthands.hs

Emoji.hs:
	cabal run scrape-symbols.hs emoji | sed -e 's/^/  /' >> $@
.PHONY: Emoji.hs

src/Typst/Symbols.hs: Symbols.hs Shorthands.hs Emoji.hs
	cpp -P -traditional-cpp -Wno-unused-command-line-argument Symbols.hs.template > $@
