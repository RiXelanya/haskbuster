module Haskbuster (main) where

import Lib

main :: IO ()
main = let base = "http://en.wikipedia.org/wiki/"
           dirs = ["Orange" , "matusa"]
           in runBuster base dirs
    
