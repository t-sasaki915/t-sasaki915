{-# LANGUAGE QuasiQuotes #-}

module Page.Home (HomePage (..)) where

import           Page (Page (..), defaultPageLayout, shamlet)

data HomePage = HomePage deriving Show

instance Page HomePage where
    pageName HomePage = "index"

    pageContent HomePage =
        defaultPageLayout $
            [shamlet|
                <p>test
            |]
