-- | A record for a typst symbol.
data Sym = Sym{
  symName :: Text,
  symIsAccent :: Bool,
  symDeprecation :: Maybe Text,
  symMathClass :: MathClass,
  symText :: Text
  }
  deriving (Show)

-- | The math-class attribute for a typst symbol.
data MathClass =
    None
  | Alphabetic
  | Relation
  | Binary
  | Opening
  | Punctuation
  | Fence
  deriving (Show, Read)

