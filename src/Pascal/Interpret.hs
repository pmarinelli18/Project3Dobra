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
import qualified Data.Map as Map

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
 
unsignedConstantEval :: UnsignedConstant -> Map.Map String (String, Val) -> Val
unsignedConstantEval    (UN unsignedNumber) varMap = unsignedNumberEval unsignedNumber
unsignedConstantEval    (Str str) varMap = Id str
unsignedConstantEval    (Nil) varMap= Id ("Nil")

functionDesignatorEval :: FunctionDesignator -> Map.Map String (String, Val) -> Val
functionDesignatorEval (FDesignate "cos" parameterList) varMap = Real (cos(toFloat(parameterListEval parameterList varMap)))
functionDesignatorEval (FDesignate "sin" parameterList) varMap = Real (sin(toFloat(parameterListEval parameterList varMap)))
functionDesignatorEval (FDesignate "sqrt" parameterList) varMap = Real (sqrt(toFloat(parameterListEval parameterList varMap)))
functionDesignatorEval (FDesignate "ln" parameterList) varMap = Real (log(toFloat(parameterListEval parameterList varMap)))
functionDesignatorEval (FDesignate "dopower" parameterList) varMap = Real (cos(toFloat(parameterListEval parameterList varMap)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------

factorEval :: Factor -> Map.Map String (String, Val) -> Val    --Add boolean to Val in Val.hs
factorEval (FactorVariable variable) varMap =     Real (1.0)
factorEval (FactorExpression expression) varMap =  Real (2.0)
factorEval (FactorFD functionDesignator) varMap =  functionDesignatorEval functionDesignator varMap
factorEval (FactorUC unsignedConstant) varMap =  unsignedConstantEval unsignedConstant varMap
factorEval (FactorSe set) varMap = Real (5.0)
factorEval (FactorNot factor) varMap = Real (6.0)
factorEval (FactorBool bool) varMap = Real (7.0)


signedFactorEval :: SignedFactor -> Map.Map String (String, Val) -> Val 
signedFactorEval (SignedFactorDefault factor) varMap = factorEval factor varMap
signedFactorEval (SignedFactorPlus factor) varMap = factorEval factor varMap
signedFactorEval (SignedFactorMinus factor) varMap = factorEval factor varMap

termEval :: Term -> Map.Map String (String, Val) -> Val
termEval (TermSingle signedFactor) varMap = signedFactorEval signedFactor varMap
termEval (TermMultipleMult signedFactor term) varMap = Real((toFloat (signedFactorEval signedFactor varMap )) * (toFloat(termEval term varMap)))
termEval (TermMultipleDivision signedFactor term) varMap = Real((toFloat (signedFactorEval signedFactor varMap )) / (toFloat(termEval term varMap )))
termEval (TermMultipleDiv signedFactor term) varMap = Real((toFloat (signedFactorEval signedFactor varMap)) / (toFloat(termEval term varMap)))
termEval (TermMultipleMod signedFactor term) varMap = Real((toFloat (signedFactorEval signedFactor varMap)) * (toFloat(termEval term varMap)))--Integer((toInt(signedFactorEval signedFactor)) `mod` (toInt(termEval term)))
termEval (TermMultipleAnd signedFactor term) varMap = Boolean((toBool (signedFactorEval signedFactor varMap)) && (toBool(termEval term varMap)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "mod" YET Maybe havnt tested it yet ---------------------------------------------------

simpleExpressionEval :: SimpleExpression -> Map.Map String (String, Val) ->Val
simpleExpressionEval (SingleExpressionTermSingle term) varMap = termEval term varMap
simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) varMap = Real((toFloat (termEval term varMap)) + (toFloat(simpleExpressionEval simpleExpression varMap)))
simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) varMap = Real((toFloat (termEval term varMap)) - (toFloat(simpleExpressionEval simpleExpression varMap)))
simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap = Boolean((toBool (termEval term varMap)) || (toBool (simpleExpressionEval simpleExpression varMap)))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Or" YET Maybe havnt tested it yet ---------------------------------------------------


expressionEval :: Expression -> Map.Map String (String, Val) -> Val
expressionEval (ExpressionSingle simpleExpression ) varMap = simpleExpressionEval simpleExpression varMap
expressionEval (ExpressionMultipleE simpleExpression expression) varMap = Boolean ((simpleExpressionEval simpleExpression varMap) == (expressionEval expression varMap))
expressionEval (ExpressionMultipleNE simpleExpression expression) varMap= Boolean ((simpleExpressionEval simpleExpression varMap) /= (expressionEval expression varMap))
expressionEval (ExpressionMultipleLT simpleExpression expression) varMap= Boolean ((toFloat(simpleExpressionEval simpleExpression varMap)) < (toFloat(expressionEval expression varMap)))
expressionEval (ExpressionMultipleLTE simpleExpression expression) varMap= Boolean ((toFloat(simpleExpressionEval simpleExpression varMap)) <= (toFloat(expressionEval expression varMap)))
expressionEval (ExpressionMultipleGT simpleExpression expression) varMap= Boolean ((toFloat(simpleExpressionEval simpleExpression varMap)) > (toFloat(expressionEval expression varMap)))
expressionEval (ExpressionMultipleGTE simpleExpression expression) varMap= Boolean ((toFloat(simpleExpressionEval simpleExpression varMap)) >= (toFloat(expressionEval expression varMap)))
expressionEval (ExpressionMultipleIN simpleExpression expression) varMap= Boolean ((simpleExpressionEval simpleExpression varMap) == (expressionEval expression varMap))
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "In" YET ---------------------------------------------------

actualParameterEval :: ActualParameter -> Map.Map String (String, Val) -> Val
actualParameterEval (ActualParameterSingle expression ) varMap = expressionEval expression varMap
actualParameterEval (ActualParameterMultiple actualParameter expression) varMap= Real(1.4)

parameterListEval :: ParameterList -> Map.Map String (String, Val) -> Val
parameterListEval (ParameterListSingle x) varMap = actualParameterEval x varMap 
parameterListEval (ParameterListMulitiple y x) varMap = Id (concat (valToStr (parameterListEval y varMap), valToStr (actualParameterEval x varMap)))

procedureStatementEval :: ProcedureStatement -> Map.Map String (String, Val)-> Val
procedureStatementEval (SingleProcedureStatement str) varMap = Real (0.11)
procedureStatementEval (MultiProcedureStatement "writeln" x) varMap = parameterListEval x varMap

simpleStatementEval :: SimpleStatement -> Map.Map String (String, Val) -> Val
simpleStatementEval (PS ps) varMap = procedureStatementEval ps varMap

ifStatementEval :: IfStatement -> Map.Map String (String, Val) -> String
ifStatementEval (IfState expression statement) varMap = if (toBool(expressionEval expression varMap)) then (statementEval statement varMap) else ""
ifStatementEval (IfStateElse expression statement1 statement2) varMap = if (toBool(expressionEval expression varMap)) then (statementEval statement1 varMap) else (statementEval statement2 varMap)

--constListEval :: ConstList -> Val
--constListEval (ConstListSingle x) = constantEval x

--constantEval :: Constant -> Val
--constantEval (ConstantUN unsignedNumber) = unsignedNumberEval unsignedNumber

--caseListElementEval :: CaseListElement -> (Val,Val)
--caseListElementEval (CaseListElementSingle const statement) = (constListEval const, Id (statementEval statement) )

--caseListElementsEval :: CaseListElements -> [(Val, Val)]
--caseListElementsEval (CaseListElementsSingle element ) = [caseListElementEval element]
--caseListElementsEval (CaseListElementsMultiple element case_list ) = (caseListElementEval element : caseListElementsEval case_list)

caseListElements_eval :: CaseListElements -> Map.Map String (String, Val) -> [(Val, Val)]
caseListElements_eval (CaseListElementsSingle element ) varMap = [caseListElement_eval element varMap]
caseListElements_eval (CaseListElementsMultiple element case_list ) varMap=  (concat [caseListElement_eval element varMap : (caseListElements_eval case_list varMap)])

caseListElement_eval :: CaseListElement -> Map.Map String (String, Val)-> (Val, Val)
caseListElement_eval (CaseListElementSingle const statement) varMap= (constList_eval const varMap, Id (statementEval statement varMap) )

constList_eval :: ConstList -> Map.Map String (String, Val)-> Val
constList_eval (ConstListSingle x) varMap= constant_eval x varMap

constant_eval :: Constant -> Map.Map String (String, Val)-> Val
constant_eval (ConstantUN unsignedNumber) varMap = unsignedNumberEval unsignedNumber varMap


removeIndex :: [(Val, Val)] -> Int ->[(Val, Val)]
removeIndex xs n = fst notGlued ++ snd notGlued
    where notGlued = (take (n-1) xs, drop n xs)

caseStatementEval :: CaseStatement -> Map.Map String (String, Val) -> String
caseStatementEval (Case expression case_list) varMap =  if  (( expressionEval expression varMap) == (fst(head (caseListElements_eval case_list varMap)))) 
                                                            then (valToStr (snd(head(caseListElements_eval case_list varMap))))
                                                            else (caseStatementEval (CaseBreakDown expression (removeIndex (caseListElements_eval case_list) 1) varMap ) varMap)
caseStatementEval (CaseBreakDown expression case_list) varMap=  if  (( expressionEval expression varMap) == (fst(head (case_list)))) 
                                                            then (valToStr(snd(head(case_list))))
                                                            else (caseStatementEval (CaseBreakDown expression(removeIndex case_list 1) varMap) varMap)
--caseStatementEval (Case expression case_list) =  case  (toFloat(expressionEval expression)) of (toFloat(fst(head(caseListElements_eval case_list)))) -> (snd(head(caseListElements_eval case_list)))
--caseStatementEval (Case Expression CaseListElements) =
--caseStatementEval (CaseElse Expression CaseListElements [Statement]) =

conditionalStatementEval :: ConditionalStatement -> Map.Map String (String, Val)-> Val
conditionalStatementEval (ConditionalStatementIf ifStatement) varMap = Id (ifStatementEval ifStatement varMap)
conditionalStatementEval (ConditionalStatementCase caseStatement) varMap = Id (caseStatementEval caseStatement varMap)

--repetetiveStatementEval :: RepetetiveStatement -> Val

--withStatementEval :: WithStatement -> Val

structuredStatementEval :: StructuredStatement -> Map.Map String (String, Val) ->Val
--structuredStatementEval (StructuredStatementCompoundStatement statementArray) =
structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) varMap = conditionalStatementEval conditionalStatement varMap
--structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement) =
--structuredStatementEval ( StructuredStatementWithStatement withStatement) =

unlabelledStatementEval :: UnlabelledStatement -> Map.Map String (String, Val)-> Val
unlabelledStatementEval (UnlabelledStatementSimpleStatement simpleStatement) varMap= simpleStatementEval simpleStatement varMap
unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) varMap= structuredStatementEval structuredStatement varMap

statementEval :: Statement -> Map.Map String (String, Val) -> String
statementEval (StatementUnlabelledStatement us) varMap = valToStr (unlabelledStatementEval us varMap)

statementToString :: [Statement] -> Map.Map String (String, Val)-> [String]
statementToString (x) varMap= map statementEval (x) varMap   --Made an edit here ************************8******

statementsEval :: [Statement] -> Map.Map String (String, Val) -> Val
statementsEval (x) varMap = Id (concat (statementToString x varMap) ) --show (traverse (statementEval x)) ]


variableDeclarationEval :: VariableDeclaration -> Map.Map String (String, Val) -> Map.Map String (String, Val)
variableDeclarationEval (VariableDeclarationMainBool str) varMap =    (Map.insert (head(str)) ("Bool", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainReal str) varMap =  (Map.insert (head(str)) ("Real", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainString str) varMap =  (Map.insert (head(str)) ("String", Boolean True) varMap) 

variableDeclarationPartEval :: VariableDeclarationPart -> Map.Map String (String, Val) -> Map.Map String (String, Val)
variableDeclarationPartEval (VariableDeclarationPartSingle variableDeclaration ) varMap = variableDeclarationEval variableDeclaration varMap
--variableDeclarationPartEval (VariableDeclarationPartMultiple variableDeclaration variableDeclarationPartMultiple varMap) = variableDeclarationEval variableDeclaration varMap

blockOptionsEval :: BlockOptions -> Map.Map String (String, Val)
blockOptionsEval (BlockOptionsVariableDeclarationPart variableDeclarationPart) = variableDeclarationPartEval variableDeclarationPart Map.empty

blockEval :: Block -> Val
blockEval (BlockCopoundStatement s ) = statementsEval s Map.empty
blockEval (BlockVariableDeclarationPart b s) = statementsEval s (blockOptionsEval b)

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = (valToStr (blockEval block))

interpret _ = "Not implemented"
