module Main (main) where

import Lib
import Options.Applicative
import System.IO

data Opts = Opts {
    filename :: String
    , baseurl :: String
}

sample :: Parser Opts
sample = Opts
      <$> strOption
          ( long "file"
         <> short 'f'
         <> metavar "FILENAME"
         <> help "Filename containing the wordlists" )
      <*> strOption
          ( long "base"
         <> short 'b'
         <> metavar "BASE"
         <> help "Base url" )

execBuster :: Opts -> IO ()
execBuster (Opts file base) = do 
    handle <- openFile file ReadMode
    contents <- hGetContents handle
    let dirs = words contents
    runBuster base dirs
execBuster _ = putStrLn "Application cant run"

main :: IO ()
main = execBuster =<< execParser options
    where 
        options = info (sample <**> helper)
          ( fullDesc
         <> progDesc "Enumerates web directory"
         <> header "hello - an app to enumerate web directory" )
    
