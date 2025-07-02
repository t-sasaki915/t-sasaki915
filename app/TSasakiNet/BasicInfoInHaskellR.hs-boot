module TSasakiNet.BasicInfoInHaskellR (getBasicInfoInHaskellR) where

import                          Yesod      (HandlerFor, Html)

import {-# SOURCE #-}           TSasakiNet (TSasakiNet)

getBasicInfoInHaskellR :: (HandlerFor TSasakiNet) Html
