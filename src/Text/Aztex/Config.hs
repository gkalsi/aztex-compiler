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
      [ ("lbrace", AztexFunction [] $ Token "{")
      , ("rbrace", AztexFunction [] $ Token "}")
      , ("leftBrace", AztexFunction [] $ MathBlock (Token "\\left\\{"))
      , ("rightBrace", AztexFunction [] $ MathBlock (Token "\\right\\}"))
      , ("implicit_math", AztexFunction [] $ ImplicitModeSwitch LatexMath)
      , ("implicit_text", AztexFunction [] $ ImplicitModeSwitch LatexText)
      , ("titlepage", AztexFunction ["title", "author"] $ TitlePage (CallBinding "title" []) (CallBinding "author" []))
      ]
  , exports = Map.empty
  , aztexMode = TextMode
  , latexMode = LatexText
  , titlePage = Nothing
  }


aztexOutmostBlock :: Aztex -> Aztex
aztexOutmostBlock = TextBlock

