module TSasakiNet.HsMakefilesR (getHsMakefilesR) where

import                          Data.Text  (Text)
import                          Yesod      (HandlerFor, TypedContent)

import {-# SOURCE #-}           TSasakiNet (TSasakiNet)

getHsMakefilesR :: Text -> [Text] -> (HandlerFor TSasakiNet) TypedContent
