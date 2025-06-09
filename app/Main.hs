module Main (main) where

import           Data.ByteString          (ByteString)
import qualified Data.ByteString          as BS
import           Data.Text                (unpack)
import           Options.Applicative
import           System.Directory         (createDirectoryIfMissing)
import           System.FilePath          ((</>))
import           Text.Blaze.Renderer.Utf8 (renderMarkup)
import           Text.Printf              (printf)

import           Page                     (Page (..))
import           Page.BasicInfoInHaskell  (BasicInfoInHaskellPage (..))
import           Page.Home                (HomePage (..))
import           Statics                  (staticFiles)

newtype GeneratorContext = GeneratorContext
    { outputDir :: FilePath
    }

generatePages :: GeneratorContext -> IO ()
generatePages ctx = do
    createDirectoryIfMissing True (outputDir ctx)

    putStrLn "Copying static files..."

    mapM_ copyStaticFile staticFiles

    putStrLn "Generating HTMLs..."

    generateHtml HomePage
    generateHtml BasicInfoInHaskellPage

    putStrLn "Complete"

    where
        copyStaticFile :: (FilePath, ByteString) -> IO ()
        copyStaticFile (fileName, staticFile) =
            BS.writeFile (outputDir ctx </> fileName) staticFile >>
                putStrLn (printf "Copied %s" fileName)

        generateHtml :: Page a => a -> IO ()
        generateHtml page =
            case pageName page of
                "index" -> writeHtml (outputDir ctx)
                pageDirName' ->
                    let pageDir = outputDir ctx </> unpack pageDirName' in
                        createDirectoryIfMissing True pageDir >>
                            writeHtml pageDir
            where
                writeHtml :: FilePath -> IO ()
                writeHtml filePath =
                    let renderedHtml = BS.toStrict $ renderMarkup (pageContent page) in
                        BS.writeFile (filePath </> "index.html") renderedHtml >>
                            putStrLn (printf "Generated %s" (show page))


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
