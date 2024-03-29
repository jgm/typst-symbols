build:
	cabal build
.PHONY: build

update-symbols: Symbols.hs Emoji.hs Shorthands.hs
	mv Symbols.hs src/Typst/Symbols.hs
	mv Shorthands.hs src/Typst/Shorthands.hs
	mv Emoji.hs src/Typst/Emoji.hs
.PHONY: update-symbols

Symbols.hs: src/Typst/Symbols.hs
	awk '!done { print $0; if ($$0 ~ /-- autogenerated/) done=1 }' $< > $@
	cabal run scrape-symbols.hs sym | sed -e 's/^/  /' >> $@

Shorthands.hs: src/Typst/Shorthands.hs
	awk '!done { print $0; if ($$0 ~ /-- autogenerated/) done=1 }' $< > $@
	cabal run scrape-symbols.hs shorthand | sed -e 's/^/  /' >> $@

Emoji.hs: src/Typst/Emoji.hs
	awk '!done { print $0; if ($$0 ~ /-- autogenerated/) done=1 }' $< > $@
	cabal run scrape-symbols.hs emoji | sed -e 's/^/  /' >> $@

