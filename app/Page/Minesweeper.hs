module Page.Minesweeper (Minesweeper (..)) where

import           Page (Page (..), defaultPageLayout, shamlet)

data Minesweeper = Minesweeper deriving Show

instance Page Minesweeper where
    pageName Minesweeper = "minesweeper"

    pageContent Minesweeper =
        defaultPageLayout "MinesweeperHS"
            [shamlet|
                <script>
                    window.addEventListener("load", () => {
                        window.location.href = "https://minesweeper.t-sasaki.net";
                    });

                <h1>
                    Redirecting to
                    <a href="https://minesweeper.t-sasaki.net">minesweeper.t-sasaki.net
                    ...
            |]
