module Lib (runBuster) where

    import Network.HTTP.Simple

    printcode :: Int -> String -> IO()
    printcode a dir = case a of
                       200 -> putStrLn $ dir ++ " - This exists"
                       _ -> putStrLn $ dir ++ " - This does not exists"


    runBuster :: String -> [String] -> IO()
    runBuster _ [] = do
        putStrLn "finished"
    runBuster base (dir:dirs) = do
        let url = base ++ dir
        req <- parseRequest url
        resp <- httpBS req
        let respCode = getResponseStatusCode resp
        printcode respCode dir
        runBuster base dirs
