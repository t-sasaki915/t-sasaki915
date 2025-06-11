{-# LANGUAGE QuasiQuotes #-}

module Page
    ( HamletPage
    , Page (..)
    , defaultPageLayout
    , shamlet
    ) where

import           Data.Text     (Text)
import           Data.Typeable (Typeable)
import           Text.Blaze    (Markup)
import           Text.Hamlet   (shamlet)

type HamletPage = Markup

class (Typeable a, Show a) => Page a where
    pageName :: a -> Text
    pageContent :: a -> HamletPage


defaultPageLayout :: Text -> HamletPage -> HamletPage
defaultPageLayout title content =
    [shamlet|
        $doctype 5
        <html lang="en">
            <head>
                <title>#{title} - t-sasaki.net
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta name="description" content="t-sasaki.net">
                <link rel="stylesheet" href="/index.css">

            <body>
                ^{content}
    |]
