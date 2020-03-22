module Pascal.Interpret 
(
    numToString,
    interpret
)
where

--import Pascal.Val
import Pascal.Data

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- make sure you write test unit cases for all functions
--expNum :: Exp -> Float
--expNum (Real x) = x
--expNum (Op1 "+" x) = ( expNum x )
--expNum (Op1 "-" x) = ( - (expNum x) )
--expNum (Op2 "+" x y) = ( expNum x + expNum y)
--expNum (Op2 "*" x y) = ( expNum x * expNum y)

numToString :: Float -> String
numToString (x) = (show x)

interpret :: Program -> String
-- TODO: write the interpreter
interpret _ = "Not implemented"