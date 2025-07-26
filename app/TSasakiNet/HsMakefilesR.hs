module TSasakiNet.HsMakefilesR (getHsMakefilesR) where

import           Data.Text  (Text, intercalate)
import           Yesod      (HandlerFor, Html, redirect)

import           TSasakiNet (TSasakiNet)

latestMakefileVersion :: Text
latestMakefileVersion = "0.1.0.0"

getHsMakefilesR :: Text -> [Text] -> (HandlerFor TSasakiNet) Html
getHsMakefilesR makefileVersion makefilePaths = do
    let makefileVersion' = case makefileVersion of
            "latest" -> latestMakefileVersion
            x        -> x

    redirect ("https://raw.githubusercontent.com/t-sasaki915/haskell-makefiles/refs/tags/" <> makefileVersion' <> "/" <> intercalate "/" makefilePaths <> "/Makefile")
