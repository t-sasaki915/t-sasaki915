module TSasakiNet.SiteInformationR (getSiteInformationR) where

import                          Yesod      (HandlerFor, Html)

import {-# SOURCE #-}           TSasakiNet (TSasakiNet)

getSiteInformationR :: (HandlerFor TSasakiNet) Html
