module TSasakiNet.BasicInfoInHaskellR (getBasicInfoInHaskellR) where

import           Yesod      (HandlerFor, Html, whamlet)

import           TSasakiNet (Route (HomeR), TSasakiNet, defaultTSasakiNetLayout)

getBasicInfoInHaskellR :: (HandlerFor TSasakiNet) Html
getBasicInfoInHaskellR = defaultTSasakiNetLayout "Basic Informations in Haskell"
    [whamlet|
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
                <span>instance SelfIntroduction TomaSasaki where
                <span>    name :: TomaSasaki -> Name
                <span>    name TomaSasaki = GivenNameAndFamilyName "TOMA" "SASAKI"
                <br>
                <span>    birthday :: TomaSasaki -> Date
                <span>    birthday TomaSasaki = DDMMYYYY 15 09 2006
                <br>
                <span>    education :: TomaSasaki -> (EducationLevel, School)
                <span>    education TomaSasaki = (Undergraduate, TheUniversityOfManchester)
                <br>
                <span>    residence :: TomaSasaki -> IO Place
                <span>    residence TomaSasaki =
                <span>        personStatus TomaSasaki >>= \case
                <span>            OnLongHoliday -> pure Japan
                <span>            _             -> pure England

        <a href=@{HomeR}>Back
    |]
