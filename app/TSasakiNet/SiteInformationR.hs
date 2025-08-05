module TSasakiNet.SiteInformationR (getSiteInformationR) where

import           Yesod      (HandlerFor, Html, whamlet)

import           TSasakiNet (Route (HomeR), TSasakiNet, defaultTSasakiNetLayout)

getSiteInformationR :: (HandlerFor TSasakiNet) Html
getSiteInformationR = defaultTSasakiNetLayout "Site Information"
    [whamlet|
        <h1>Site Information

        This site is written in
        <a href="https://www.haskell.org/">Haskell
        with
        <a href="https://www.yesodweb.com/">Yesod
        framework.
        <br>

        The server of this site will be built automatically with
        <a href="https://github.com/features/actions">GitHub Actions
        and will be deployed with
        <a href="https://linux.die.net/man/1/scp">scp
        command.
        <br>

        The server is located at my home in Japan. And its OS is
        <a href="https://www.debian.org/">Debian
        12.
        <br>

        The GitHub repository of this site is
        <a href="https://github.com/t-sasaki915/t-sasaki915">t-sasaki915/t-sasaki915

        <br>
        <br>
        <a href=@{HomeR}>Back
    |]
