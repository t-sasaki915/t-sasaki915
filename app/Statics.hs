{-# LANGUAGE TemplateHaskell #-}

module Statics (staticFiles) where

import           Data.ByteString (ByteString)
import           Data.FileEmbed  (embedFile)

staticFiles :: [(FilePath, ByteString)]
staticFiles =
    [ ("index.css", $(embedFile "./static/index.css"))
    ]
