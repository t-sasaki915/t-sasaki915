module TSasakiNet.HsMakefilesR (getHsMakefilesR) where

import           Data.Text           (Text, intercalate, unpack)
import           Network.HTTP.Simple
import           Yesod

import           TSasakiNet          (TSasakiNet)

newtype GitHubAPI = GitHubAPI
    { tagName :: Text
    }

instance FromJSON GitHubAPI where
    parseJSON (Object v) = GitHubAPI <$> v .: "tag_name"
    parseJSON _          = fail "Invalid GitHubAPI"

fetchLatestTag :: IO Text
fetchLatestTag =
    parseRequest "https://api.github.com/repos/t-sasaki915/haskell-makefiles/releases/latest" >>= \request ->
        let request' = setRequestHeader "User-Agent" ["request"] request in
            tagName . getResponseBody <$> httpJSON request'

getHsMakefilesR :: Text -> [Text] -> (HandlerFor TSasakiNet) TypedContent
getHsMakefilesR makefileVersion makefilePaths = do
    makefileVersion' <-
        case makefileVersion of
            "latest" -> liftIO fetchLatestTag
            x        -> pure x

    let githubUrl = "https://raw.githubusercontent.com/t-sasaki915/haskell-makefiles/refs/tags/" <> makefileVersion' <> "/" <> intercalate "/" makefilePaths <> "/Makefile"

    response <- parseRequest (unpack githubUrl) >>= httpBS

    case getResponseStatusCode response of
        200 -> sendResponse $ TypedContent "text/plain" (toContent (getResponseBody response))
        404 -> notFound
        _   -> invalidArgs []
