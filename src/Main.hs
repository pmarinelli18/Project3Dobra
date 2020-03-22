module Main where

import Pascal
import System.Environment

main :: IO ()
main = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    case parseString contents of 
        Left err -> print $ show err
        Right ast -> do
            -- Show ast
            putStrLn $ interpret ast 
        
        
--Cabal run Pascal src/Tests/test1.pas

