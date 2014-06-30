module Text.Aztex.Config where

import Text.Aztex.Types
import qualified Data.Map as Map

aztexFileExtension :: String
aztexFileExtension = "azx"

aztexCommentStart :: String
aztexCommentStart = "%"

builtInState :: AztexState
builtInState = AztexState {
    bindings = Map.fromList $
      [ ("lbrace", AztexFunction [] $ Token "\\{")
      , ("rbrace", AztexFunction [] $ Token "\\}")
      , ("leftBrace", AztexFunction [] $ MathBlock (Token "\\left\\{"))
      , ("rightBrace", AztexFunction [] $ MathBlock (Token "\\right\\}"))
      , ("implicit_math", AztexFunction [] $ ImplicitModeSwitch LatexMath)
      , ("implicit_text", AztexFunction [] $ ImplicitModeSwitch LatexText)
      ]
  , exports = Map.empty
  , aztexMode = TextMode
  , latexMode = LatexText
  }


aztexOutmostBlock :: Aztex -> Aztex
aztexOutmostBlock = TextBlock
