module TSasakiNet.HomeR (getHomeR) where

import                          Yesod      (HandlerFor, Html)

import {-# SOURCE #-}           TSasakiNet (TSasakiNet)

getHomeR :: (HandlerFor TSasakiNet) Html
