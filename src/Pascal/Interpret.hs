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
--conditionalStatementEval (ConditionalStatementCase caseStatement) = ifStatementEval caseStatement

--repetetiveStatementEval :: RepetetiveStatement -> Val

--withStatementEval :: WithStatement -> Val

structuredStatementEval :: StructuredStatement ->Val
--structuredStatementEval (StructuredStatementCompoundStatement statementArray) =
structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) = conditionalStatementEval conditionalStatement
--structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement) =
--structuredStatementEval ( StructuredStatementWithStatement withStatement) =

unlabelledStatementEval :: UnlabelledStatement -> Val
unlabelledStatementEval (UnlabelledStatementSimpleStatement simpleStatement) = simpleStatementEval simpleStatement
unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) = structuredStatementEval structuredStatement

statementEval :: Statement -> String
statementEval (StatementUnlabelledStatement us) = valToStr (unlabelledStatementEval us)

statementToString :: [Statement] -> [String]
statementToString (x) = map statementEval (x)

statementsEval :: [Statement] -> Val
statementsEval (x) = Id (concat (statementToString x) ) --show (traverse (statementEval x)) ]

blockEval :: Block -> Val
blockEval (BlockCopoundStatement s ) = statementsEval s
blockEval (BlockVariableDeclarationPart b s) = statementsEval s

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = (valToStr (blockEval block))

interpret _ = "Not implemented"
