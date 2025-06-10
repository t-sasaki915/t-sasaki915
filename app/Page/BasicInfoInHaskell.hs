{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE QuasiQuotes  #-}

module Page.BasicInfoInHaskell (BasicInfoInHaskellPage (..)) where

import           Page (Page (..), defaultPageLayout, shamlet)

data BasicInfoInHaskellPage = BasicInfoInHaskellPage deriving Show

instance Page BasicInfoInHaskellPage where
    pageName BasicInfoInHaskellPage = "BasicInfoInHaskell"

    pageContent BasicInfoInHaskellPage =
        defaultPageLayout
            [shamlet|
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/styles/vs.min.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/highlight.min.js">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.11.1/languages/haskell.min.js">
                <script>hljs.highlightAll();

                <pre>
                    <code .language-haskell>
                        <span>{-# LANGUAGE InstanceSigs #-}
                        <span>{-# LANGUAGE OverloadedStrings #-}
                        <span>{-# LANGUAGE LambdaCase #-}
                        <br>
                        <span>data TomaSasaki = TomaSasaki
                        <br>
                        <span>instance Person TomaSasaki where
                        <span>    name :: TomaSasaki -> Text
                        <span>    name TomaSasaki = "Toma Sasaki"
                        <br>
                        <span>    birthday :: TomaSasaki -> Date
                        <span>    birthday TomaSasaki = DDMMYYYY 15 09 2006
                        <br>
                        <span>    majors :: TomaSasaki -> [Subject]
                        <span>    majors TomaSasaki = [Maths, ComputerScience]
                        <br>
                        <span>    residence :: TomaSasaki -> IO Place
                        <span>    residence TomaSasaki =
                        <span>        personStatus TomaSasaki >>= \case
                        <span>            OnLongHoliday -> return Japan
                        <span>            _             -> return England

                <a href="/">Back
            |]
