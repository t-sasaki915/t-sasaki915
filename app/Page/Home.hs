{-# LANGUAGE QuasiQuotes #-}

module Page.Home (HomePage (..)) where

import           Page (Page (..), defaultPageLayout, shamlet)

data HomePage = HomePage deriving Show

instance Page HomePage where
    pageName HomePage = "index"

    pageContent HomePage =
        defaultPageLayout $
            [shamlet|
                <h1>About Me
                <p>Haskell enjoyer, amateur violin player, Mozart lover and university student.

                <h2>Basic informations
                <span>Name: Toma Sasaki<br>
                <span>Birthday: 15 September 2006<br>
                <span>Major: Maths and Computer Science<br>
                <span>Residence: England and Japan (when I'm on a long holiday)<br>

                <h2>Skills
                <ul>
                    <li>Programming with Haskell
                    <li>Programming with Scala

                <h2>Languages I speak
                <ul>
                    <li>Japanese (ja_JP, very confident)
                    <li>English (en_GB, confident)

                <h2>Affiliations
                <ul>
                    <li>The University of Manchester (undergraduate student)

                <footer>
                    <a href="https://github.com/t-sasaki915/t-sasaki915">This page is written in Haskell
                    \
                    because why not.
            |]
