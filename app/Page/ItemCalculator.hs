{-# LANGUAGE QuasiQuotes #-}

module Page.ItemCalculator (ItemCalculator (..)) where

import           Page (Page (..), defaultPageLayout, shamlet)

data ItemCalculator = ItemCalculator deriving Show

instance Page ItemCalculator where
    pageName ItemCalculator = "itemcalculator"

    pageContent ItemCalculator =
        defaultPageLayout "ItemAmountCalculator"
            [shamlet|
                <script>
                    window.addEventListener("load", () => {
                        window.location.href = "https://itemcalculator.t-sasaki.net";
                    });

                <h1>
                    Redirecting to
                    <a href="https://itemcalculator.t-sasaki.net">itemcalculator.t-sasaki.net
                    ...
            |]
