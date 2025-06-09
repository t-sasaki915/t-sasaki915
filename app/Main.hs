module Main (main) where

import qualified Data.ByteString          as BS
import           Options.Applicative
import           System.Directory         (createDirectoryIfMissing)
import           System.FilePath          ((</>))
import           Text.Blaze.Renderer.Utf8 (renderMarkup)
import           Text.Printf              (printf)

import           Page                     (Page (..))
import           Page.Home                (HomePage (..))

data GeneratorContext = GeneratorContext
    { outputDir :: FilePath
    }

generatePages :: GeneratorContext -> IO ()
generatePages ctx = do
    putStrLn "Generating HTMLs..."

    createDirectoryIfMissing True (outputDir ctx)

    let generator = generatePage ctx

    generator HomePage

    putStrLn "Complete"

generatePage :: Page a => GeneratorContext -> a -> IO ()
generatePage ctx page =
    let renderedHtml = renderMarkup (pageContent page)
        fileName = printf "%s.html" (pageName page) in
            BS.writeFile (outputDir ctx </> fileName) (BS.toStrict renderedHtml) >>
                putStrLn (printf "Generated %s (%s)" (show page) fileName)

argParser :: Parser GeneratorContext
argParser = GeneratorContext
    <$> strOption
        ( long "outputDir"
       <> short 'o'
       <> metavar "FilePath"
       <> value "build"
       <> help "HTML output directory"
       <> showDefault
        )

main :: IO ()
main = generatePages =<< execParser opts
    where
        opts =
            info (argParser <**> helper)
                ( fullDesc
               <> progDesc "Generate HTMLs of t-sasaki.net"
               <> header "t-sasaki.net HTML generator"
                )
