module Pascal.Val where
-- this file contains definitions for Val and aux functions

import Data.Maybe (isJust)
import Text.Read (readMaybe)

-- The values manipulated by FORTH
data Val = Integer Int 
    | Real Float
    | Id String
    | Boolean Bool
    deriving (Show, Eq)

-- converts string to Val 
-- sequence tried is Integer, Float, String
strToVal :: String -> Val
strToVal s = case readMaybe s :: Maybe Int of
    Just i -> Integer i
    Nothing -> case readMaybe s :: Maybe Float of
        Just f -> Real f 
        Nothing -> Id s

valToStr :: Val -> String
valToStr (Real x) = show x
valToStr (Integer x) = show x
valToStr (Id x) = show x
valToStr (Boolean x) = show x


-- converts to Float if Real or Integer, error otherwise
-- used to deal with arguments of operators
toFloat :: Val -> Float
toFloat (Real x) = x
toFloat (Integer i) = fromIntegral i     
toFloat (Id _) = error "Not convertible to float"
toFloat (Boolean _) = error "Not convertible to float"

-- converts to Float if Real or Integer, error otherwise
-- used to deal with arguments of operators
toInt :: Val -> Int
toInt (Real x) = floor x
toInt (Integer i) = i     
toInt (Id _) = error "Not convertible to Integer"
toInt (Boolean _) = error "Not convertible to Integer"

toBool :: Val -> Bool
toBool (Real _) = error "Not convertible to Integer"
toBool (Integer _) = error "Not convertible to Integer"
toBool (Id _) = error "Not convertible to Integer"
toBool (Boolean b) = b

removePunc2 :: String -> String 
removePunc2 xs = [ x | x <- xs, not (x `elem` "\"\'\\") ]

replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace [] _ _ = []
replace s find repl =
    if take (length find) s == find
        then repl ++ (replace (drop (length find) s) find repl)
        else [head s] ++ (replace (tail s) find repl)