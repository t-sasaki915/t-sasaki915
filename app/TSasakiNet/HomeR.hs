module TSasakiNet.HomeR (getHomeR) where

import           Yesod      (HandlerFor, Html, whamlet)

import           TSasakiNet (Route (..), TSasakiNet, defaultTSasakiNetLayout)

getHomeR :: (HandlerFor TSasakiNet) Html
getHomeR = defaultTSasakiNetLayout "About Me"
    [whamlet|
        <h1>About Me
        <p>Haskell enjoyer, amateur violin player, Mozart lover and university student.

        <h2>Basic Informations
        <span>Name: TOMA SASAKI<br>
        <span>Birthday: 15 September 2006<br>
        <span>Education: Undergraduate, The University of Manchester<br>
        <span>Residence: England and Japan (when I'm on a long holiday)<br>
        <br>
        <span>
            If you prefer reading my basic informations in Haskell,
            <a href=@{BasicInfoInHaskellR}>please click here.

        <h2>Skills
        <ul>
            <li>Haskell Programming

        <h2>Interests
        <ul>
            <li>(Pure) Functional Programming
            <li>Type Safety

        <h2>Favourites
        <h3>Programming Languages
        <ul>
            <li>Haskell
        <h3>Language Extensions
        <ul>
            <li>LambdaCase
            <li>OverloadedStrings
            <li>QuasiQuotes
        <h3>Functions
        <ul>
            <li>
                <a href="https://hackage.haskell.org/package/base-4.21.0.0/docs/Prelude.html#v:-62--62--61-">>>=
            <li>
                <a href="https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-Functor.html#v:-60--38--62-"><&>
            <li>
                <a href="https://hackage.haskell.org/package/base-4.21.0.0/docs/Control-Monad.html#v:forM_">forM_
            <li>
                <a href="https://hackage.haskell.org/package/extra-1.8/docs/Control-Monad-Extra.html#v:whenM">whenM
            <li>
                <a href="https://hackage.haskell.org/package/base-4.21.0.0/docs/Prelude.html#v:foldl">foldl

        <h2>Languages
        <ul>
            <li>Japanese (ja_JP, very confident)
            <li>English (en_GB, confident)

        <h2>My Works
        <ul>
            <li>
                <a href="https://github.com/t-sasaki915/InlineBrainfuck">InlineBrainfuck
                Brainfuck QuasiQuoter Library
            <li>
                <a href="https://hackage.haskell.org/package/ConsoleAsk">ConsoleAsk
                Simple CLI user input library
            <li>
                <a href="https://itemcalculator.t-sasaki.net/">ItemAmountCalculator
                A web application that helps you convert units of a huge amount of Minecraft items
            <li>
                <a href="https://minesweeper.t-sasaki.net/">MinesweeperHS
                Minesweeper written with Haskell & ghcjs

        <h2>Affiliations
        <ul>
            <li>The University of Manchester (undergraduate student)

        <h2>Accounts
        <ul>
            <li>
                GitHub:
                <a href="https://github.com/t-sasaki915">t-sasaki915
            <li>
                MuseScore:
                <a href="https://musescore.com/user/88726153">tsasaki915
            <li>
                Hackage:
                <a href="https://hackage.haskell.org/user/t_sasaki915">t_sasaki915
            <li>
                Email: netst915 [at] gmail.com

        <br>
        Technical informations about this site is available
        <a href=@{SiteInformationR}>here.
    |]
