# typst-symbols

This package provides definitions of the symbols used in typst
(<https://typst.app>).  It exports lists of triples, which can
be converted into maps or other more appropriate forms,
depending on the use case.  Each triple contains the symbol
name (Text), a Boolean that is True if the symbol is an accent,
and the resolved symbol (Text).

The symbols can be updated by scraping the typst website:
`make update` will do the work.

