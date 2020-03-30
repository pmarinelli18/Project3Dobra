module Pascal.Interpret 
(
    --writeln,
    --numToString,
    interpret
)
where

--import Pascal.Val
import Pascal.Data
import Pascal.Val

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

--writeln :: ProcedureStatement -> String
--writeln (MultiProcedureStatement "writeln" x) = (show x)

--numToString :: Float -> String
--numToString (x) = (show x)

unsignedNumberEval :: UnsignedNumber -> Val
unsignedNumberEval (UI int) = Integer int
unsignedNumberEval (UR float) = Real float
 
unsignedConstantEval :: UnsignedConstant -> Val
unsignedConstantEval    (UN unsignedNumber) = unsignedNumberEval unsignedNumber

unsignedConstantEval    (Str str) = Id str
unsignedConstantEval    (Nil) = Id ("Nil")

functionDesignatorEval :: FunctionDesignator -> Val
functionDesignatorEval (FDesignate "cos" parameterList) = Real (cos(toFloat(parameterListEval parameterList)))
functionDesignatorEval (FDesignate "sin" parameterList) = Real (sin(toFloat(parameterListEval parameterList)))
functionDesignatorEval (FDesignate "sqrt" parameterList) = Real (sqrt(toFloat(parameterListEval parameterList)))
functionDesignatorEval (FDesignate "ln" parameterList) = Real (log(toFloat(parameterListEval parameterList)))
functionDesignatorEval (FDesignate "dopower" parameterList) = Real (cos(toFloat(parameterListEval parameterList)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------

factorEval :: Factor -> Val    --Add boolean to Val in Val.hs
factorEval (FactorVariable variable) =     Real (1.0)
factorEval (FactorExpression expression) =  Real (2.0)
factorEval (FactorFD functionDesignator) =  functionDesignatorEval functionDesignator

factorEval (FactorUC unsignedConstant) =  unsignedConstantEval unsignedConstant
factorEval (FactorSe set) = Real (5.0)
factorEval (FactorNot factor) = Real (6.0)
factorEval (FactorBool bool) = Real (7.0)


signedFactorEval :: SignedFactor -> Val
signedFactorEval (SignedFactorDefault factor) = factorEval factor
signedFactorEval (SignedFactorPlus factor) = factorEval factor
signedFactorEval (SignedFactorMinus factor) = factorEval factor

termEval :: Term -> Val
termEval (TermSingle signedFactor) = signedFactorEval signedFactor
termEval (TermMultipleMult signedFactor term) = Real((toFloat (signedFactorEval signedFactor)) * (toFloat(termEval term)))
termEval (TermMultipleDivision signedFactor term) = Real((toFloat (signedFactorEval signedFactor)) / (toFloat(termEval term)))
termEval (TermMultipleDiv signedFactor term) = Real((toFloat (signedFactorEval signedFactor)) / (toFloat(termEval term)))
termEval (TermMultipleMod signedFactor term) = Real((toFloat (signedFactorEval signedFactor)) * (toFloat(termEval term)))--Integer((toInt(signedFactorEval signedFactor)) `mod` (toInt(termEval term)))
termEval (TermMultipleAnd signedFactor term) = Boolean((toBool (signedFactorEval signedFactor)) && (toBool(termEval term)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "mod" YET Maybe havnt tested it yet ---------------------------------------------------

simpleExpressionEval :: SimpleExpression ->Val
simpleExpressionEval (SingleExpressionTermSingle term)  = termEval term
simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) = Real((toFloat (termEval term)) + (toFloat(simpleExpressionEval simpleExpression)))
simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) = Real((toFloat (termEval term)) - (toFloat(simpleExpressionEval simpleExpression)))
simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) = Boolean((toBool (termEval term)) || (toBool (simpleExpressionEval simpleExpression)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Or" YET Maybe havnt tested it yet ---------------------------------------------------


expressionEval :: Expression -> Val
expressionEval (ExpressionSingle simpleExpression ) = simpleExpressionEval simpleExpression
expressionEval (ExpressionMultipleE simpleExpression expression) = Boolean ((simpleExpressionEval simpleExpression) == (expressionEval expression))
expressionEval (ExpressionMultipleNE simpleExpression expression) = Boolean ((simpleExpressionEval simpleExpression) /= (expressionEval expression))
expressionEval (ExpressionMultipleLT simpleExpression expression) = Boolean ((toFloat(simpleExpressionEval simpleExpression)) < (toFloat(expressionEval expression)))
expressionEval (ExpressionMultipleLTE simpleExpression expression) = Boolean ((toFloat(simpleExpressionEval simpleExpression)) <= (toFloat(expressionEval expression)))
expressionEval (ExpressionMultipleGT simpleExpression expression) = Boolean ((toFloat(simpleExpressionEval simpleExpression)) > (toFloat(expressionEval expression)))
expressionEval (ExpressionMultipleGTE simpleExpression expression) = Boolean ((toFloat(simpleExpressionEval simpleExpression)) >= (toFloat(expressionEval expression)))
expressionEval (ExpressionMultipleIN simpleExpression expression) = Boolean ((simpleExpressionEval simpleExpression) == (expressionEval expression))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "In" YET ---------------------------------------------------

actualParameterEval :: ActualParameter -> Val
actualParameterEval (ActualParameterSingle expression ) = expressionEval expression
actualParameterEval (ActualParameterMultiple actualParameter expression) = Real(1.4)


parameterListEval :: ParameterList -> Val
parameterListEval (ParameterListSingle x) = actualParameterEval x
parameterListEval (ParameterListMulitiple y x) = Id (concat (valToStr (parameterListEval y), valToStr (actualParameterEval x)))


procedureStatementEval :: ProcedureStatement -> Val
procedureStatementEval (SingleProcedureStatement str) = Real (0.11)
procedureStatementEval (MultiProcedureStatement "writeln" x) = parameterListEval x


simpleStatementEval :: SimpleStatement -> Val
simpleStatementEval (PS ps) = procedureStatementEval ps


ifStatementEval :: IfStatement -> String
ifStatementEval (IfState expression statement) = if (toBool(expressionEval expression)) then (statementEval statement) else ""
ifStatementEval (IfStateElse expression statement1 statement2) = if (toBool(expressionEval expression)) then (statementEval statement1) else (statementEval statement2)


conditionalStatementEval :: ConditionalStatement -> Val
conditionalStatementEval (ConditionalStatementIf ifStatement) = Id (ifStatementEval ifStatement)
conditionalStatementEval (ConditionalStatementCase caseStatement) =  (caseStatementEval caseStatement)


caseStatementEval :: CaseStatement -> Val
--caseStatementEval (Case expression case_list) =  if  (( expressionEval expression) == (fst(head (caseListElements_eval case_list)))) then (snd(head(caseListElements_eval case_list))) else ""
--caseStatementEval (Case expression case_list) =  case  (toFloat( expressionEval expression)) of (toFloat(fst(head(caseListElements_eval case_list)))) -> (snd(head(caseListElements_eval case_list)))  
caseStatementEval (Case expression case_list) = do 
    if length( caseListElements_eval case_list) > 0 
        then
            Integer(length( caseListElements_eval case_list))
        else
            Real(100)--Real(length( caseListElements_eval case_list))
 
    --case Real(150) of (fst (caseListElements_eval case_list)) -> snd(caseListElements_eval case_list) 
--I am returning a tuple; to retrieve the first element of the tuple, I use fst; to retrieve the second, I use snd                                             
caseStatementEval (CaseElse expression  case_list ifelse) =if  (toFloat( expressionEval expression) == toFloat(fst(head (caseListElements_eval case_list)))) then (snd(head(caseListElements_eval case_list))) else Real(99)


caseListElements_eval :: CaseListElements -> [(Val, Val)]
caseListElements_eval (CaseListElementsSingle element ) = [caseListElement_eval element]
caseListElements_eval (CaseListElementsMultiple element case_list ) = (caseListElement_eval element : caseListElements_eval case_list)

caseListElement_eval :: CaseListElement -> (Val,Val)
caseListElement_eval (CaseListElementSingle const statement) = (constList_eval const,  Id (statementEval statement) )

constList_eval :: ConstList -> Val
constList_eval (ConstListSingle x) = constant_eval x

constant_eval :: Constant -> Val
constant_eval (ConstantUN unsignedNumber) = unsignedNumberEval unsignedNumber




structuredStatementEval :: StructuredStatement ->Val
structuredStatementEval (StructuredStatementCompoundStatement statementArray) = strToVal(statementsEval statementArray)
structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) = conditionalStatementEval conditionalStatement
structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement) = repetetiveStatement_eval repetetiveStatement
--structuredStatementEval ( StructuredStatementWithStatement withStatement) =



repetetiveStatement_eval :: RepetetiveStatement -> Val
repetetiveStatement_eval (RepetetiveStatementWhile whileT) = Id((whileStatement_eval whileT))
repetetiveStatement_eval (RepetetiveStatementFor forLoop) = strToVal(forStatement_eval forLoop)


forStatement_eval :: ForStatement -> String
forStatement_eval (ForTo identifier expressionIn expressionF statement) = 
                    -- if((expressionEval expressionIn) == (expressionEval expressionF)) 
                    if((Real(15)) == (expressionEval expressionF)) 
                        then  ""   
                        else ( statementEval statement ++ (forStatement_eval (ForLoop identifier expressionIn expressionF  statement )) )
                        -- else ( statementEval statement ++ (forStatement_eval (ForLoop identifier expressionIn expressionF  statement )) )
                         -- Real(toFloat(expressionEval expressionIn)+1)


-- forStatement_eval (ForDown String Expression Expression Statement) =
forStatement_eval (ForLoop identifier expressionIn expressionF statement) =  
                    --if((expressionEval expressionIn) == (expressionEval expressionF)) 
                    if((Real(16)) == (expressionEval expressionF)) 
                        then  "" 
                        else  ( statementEval statement ++ (forStatement_eval (ForLoop identifier expressionIn expressionF  statement ))) --  (forStatement_eval (ForLoop identifier expressionIn expressionF  statement )) --strToVal ("")



whileStatement_eval :: WhileStatement -> String
whileStatement_eval (WhileS expression statement) = 
                        if(toBool(expressionEval expression)) then 
                             ((statementEval statement)  ++
                             (whileStatement_eval (Whileloop expression statement)) )
                             else "" -- then Id (statementEval statement)  else Real(77)
whileStatement_eval (Whileloop expression statement) = 
                        if(toBool(expressionEval expression)) then 
                            ((statementEval statement)  ++
                             (whileStatement_eval (Whileloop expression statement)) )
                            else "" --

-- whileStatement_eval (Whileloop2 expression statement) = 
--                         if(toBool(expressionEval expression)) then 
--                            ((statementEval statement)  ++
--                              (whileStatement_eval (Whileloop3 expression statement)) )
--                             else "" --

-- whileStatement_eval (Whileloop3 expression statement) = 
--                         if(toBool(expressionEval expression)) then 
--                             ("Hello3" )
--                             else "" --
            


-- whileStatement_eval (Whileloop expression statement) = 
--                         if(toBool(expressionEval expression)) then 
--                             concat((statementEval statement)   ,  
--                             (whileStatement_eval (Whileloop expression statement))  ) 
--                             else [""] --







unlabelledStatementEval :: UnlabelledStatement -> Val
unlabelledStatementEval (UnlabelledStatementSimpleStatement simpleStatement) = simpleStatementEval simpleStatement
unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) = structuredStatementEval structuredStatement

statementEval :: Statement -> String
statementEval (StatementUnlabelledStatement us) = valToStr (unlabelledStatementEval us)

statementToString :: [Statement] -> [String]
statementToString (x) = map statementEval (x)

-- statementsEval :: [Statement] -> Val
-- statementsEval (x) = Id (concat (statementToString x) ) --show (traverse (statementEval x)) ]

statementsEval :: [Statement] -> String
statementsEval (x) =  (concat (statementToString x) ) --show (traverse (statementEval x)) ]

blockEval :: Block -> String
blockEval (BlockCopoundStatement s ) = statementsEval s
blockEval (BlockVariableDeclarationPart b s) = removePunc2 (statementsEval s )
blockEval (Block_Method  method statements) = "hello2"
blockEval (Block_Variable_Method blockOp method statements) = "hello6"
     

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = ( (blockEval block))

interpret _ = "Not implemented"
