{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies    #-}
{-# OPTIONS_GHC -Wno-unused-top-binds #-}

module TSasakiNet (TSasakiNet (..), Route (..), defaultTSasakiNetLayout) where

import                          Yesod

import {-# SOURCE #-}           TSasakiNet.BasicInfoInHaskellR (getBasicInfoInHaskellR)
import {-# SOURCE #-}           TSasakiNet.HomeR               (getHomeR)
import                          TSasakiNet.StyleSheet          (commonStyleSheet)

data TSasakiNet = TSasakiNet

mkYesod "TSasakiNet" [parseRoutes|
/                   HomeR               GET
/BasicInfoInHaskell BasicInfoInHaskellR GET
|]

instance Yesod TSasakiNet

defaultTSasakiNetLayout :: Html -> Widget -> Handler Html
defaultTSasakiNetLayout title content =
    defaultLayout $ do
        setTitle (title <> " - t-sasaki.net")

        toWidgetHead
            [hamlet|
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta name="description" content="t-sasaki.net">
            |]

        toWidgetHead commonStyleSheet

        content
