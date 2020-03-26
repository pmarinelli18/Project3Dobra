module Pascal.Interpret 
(
    writeln,
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

writeln :: ProcedureStatement -> String
writeln (MultiProcedureStatement "writeln" x) = (show x)

numToString :: Float -> String
numToString (x) = (show x)

factor :: Factor -> Val    --Add boolean to Val in Val.hs
factor (FactorVariable variable) =      --convert the input to a value and try to get it to procedure statement
factor (FactorExpression expression) =  --Do expression eval here and return Val, Should copy how Project 2 didt it
factor (FactorFD functionDesignator) =  --can comment things out to make things work
factor (FactorUC unsignedConstant) =     
factor (FactorSe set) =
factor (FactorNot factor) =
factor (FactorBool bool) =

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = (show block)
interpret _ = "Not implemented"