module Main (main) where

import           Options.Applicative
import           Yesod               (warp)

import           TSasakiNet          (TSasakiNet (..))

newtype ServerContext = ServerContext
    { serverPort :: Int
    }

startServer :: ServerContext -> IO ()
startServer ctx =
    warp (serverPort ctx) TSasakiNet

main :: IO ()
main = startServer =<< execParser opts
    where
        opts =
            info (argParser <**> helper)
                ( fullDesc
               <> header "t-sasaki.net Server"
                )

        argParser = ServerContext
            <$> option auto
                ( long "serverPort"
               <> short 'p'
               <> help "Server port number"
               <> showDefault
               <> value 8080
               <> metavar "Int"
                )
