module TSasakiNet.StyleSheet (commonStyleSheet) where

import           Text.Internal.Css (Css)
import           Yesod             (cassius)

commonStyleSheet :: p -> Css
commonStyleSheet =
    [cassius|
        @import url("https://fonts.googleapis.com/css2?family=Inconsolata:wght@500&display=swap")

        *
            font-family: "Inconsolata"
            font-optical-sizing: auto
            font-weight: 500
            font-style: normal
    |]
