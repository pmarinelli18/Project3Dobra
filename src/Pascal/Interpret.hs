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
import Data.Maybe

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

type VariableMap = Map.Map String Val --Map.Map String (String, Val)

--VariableMapEval :: VariableMap -> VariableMap
--dVariableMapEval (varMap ) =


unsignedNumberEval :: UnsignedNumber -> Val
unsignedNumberEval (UI int) = Integer int
unsignedNumberEval (UR float) = Real float
 
unsignedConstantEval :: UnsignedConstant -> VariableMap -> (Val, VariableMap)
unsignedConstantEval    (UN unsignedNumber) varMap = (unsignedNumberEval unsignedNumber, varMap)
unsignedConstantEval    (Str str) varMap = ((Id str), varMap)
unsignedConstantEval    (Nil) varMap= ((Id ("Nil")), varMap)

functionDesignatorEval :: FunctionDesignator -> VariableMap -> (Val, VariableMap)
functionDesignatorEval (FDesignate "cos" parameterList) varMap = ((Real (cos(toFloat(fst(parameterListEval parameterList varMap))))), varMap)
functionDesignatorEval (FDesignate "sin" parameterList) varMap = ((Real (sin(toFloat(fst(parameterListEval parameterList varMap))))), varMap)
functionDesignatorEval (FDesignate "sqrt" parameterList) varMap = ((Real (sqrt(toFloat(fst(parameterListEval parameterList varMap))))), varMap)
functionDesignatorEval (FDesignate "ln" parameterList) varMap = ((Real (log(toFloat(fst(parameterListEval parameterList varMap))))), varMap)
functionDesignatorEval (FDesignate "dopower" parameterList) varMap = ((Real (cos(toFloat(fst(parameterListEval parameterList varMap))))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------

variableEval :: Variable -> String
variableEval (Var string) = string

factorEval :: Factor -> VariableMap -> (Val, VariableMap)    --Add boolean to Val in Val.hs
factorEval (FactorVariable variable) varMap =     (( fromJust(Map.lookup  ((variableEval variable)) varMap)), varMap)
factorEval (FactorExpression expression) varMap =  ((Real (2.0)), varMap)
factorEval (FactorFD functionDesignator) varMap =  (fst(functionDesignatorEval functionDesignator varMap), snd(functionDesignatorEval functionDesignator varMap))
factorEval (FactorUC unsignedConstant) varMap =  (fst(unsignedConstantEval unsignedConstant varMap), varMap)
factorEval (FactorSe set) varMap = ((Real (5.0)), varMap)
factorEval (FactorNot factor) varMap = ((Real (6.0)), varMap)
factorEval (FactorBool bool) varMap = ((Real (7.0)), varMap)


signedFactorEval :: SignedFactor -> VariableMap -> (Val, VariableMap)
signedFactorEval (SignedFactorDefault factor) varMap = (fst(factorEval factor varMap), varMap)
signedFactorEval (SignedFactorPlus factor) varMap = (fst(factorEval factor varMap), varMap)
signedFactorEval (SignedFactorMinus factor) varMap = (fst(factorEval factor varMap), varMap)

termEval :: Term -> VariableMap -> (Val, VariableMap)
termEval (TermSingle signedFactor) varMap = (fst(signedFactorEval signedFactor varMap), varMap)
termEval (TermMultipleMult signedFactor term) varMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap) )) * (toFloat(fst(termEval term varMap))))), varMap)
termEval (TermMultipleDivision signedFactor term) varMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap ))) / (toFloat(fst(termEval term varMap ))))), varMap)
termEval (TermMultipleDiv signedFactor term) varMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap))) / (toFloat(fst(termEval term varMap))))), varMap)
termEval (TermMultipleMod signedFactor term) varMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap))) * (toFloat(fst(termEval term varMap))))), varMap)--Integer((toInt(signedFactorEval signedFactor)) `mod` (toInt(termEval term)))
termEval (TermMultipleAnd signedFactor term) varMap = ((Boolean((toBool (fst(signedFactorEval signedFactor varMap))) && (toBool(fst(termEval term varMap))))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "mod" YET Maybe havnt tested it yet ---------------------------------------------------

simpleExpressionEval :: SimpleExpression -> VariableMap ->(Val, VariableMap)
simpleExpressionEval (SingleExpressionTermSingle term) varMap = (fst(termEval term varMap), varMap)
simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) varMap = ((Real((toFloat (fst(termEval term varMap))) + (toFloat(fst(simpleExpressionEval simpleExpression varMap))))), varMap)
simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) varMap = ((Real((toFloat (fst(termEval term varMap))) - (toFloat(fst(simpleExpressionEval simpleExpression varMap))))), varMap)
simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap = ((Boolean((toBool (fst(termEval term varMap))) || (toBool (fst(simpleExpressionEval simpleExpression varMap))))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Or" YET Maybe havnt tested it yet ---------------------------------------------------


expressionEval :: Expression -> VariableMap -> (Val, VariableMap)
expressionEval (ExpressionSingle simpleExpression ) varMap = (fst(simpleExpressionEval simpleExpression varMap), varMap)
expressionEval (ExpressionMultipleE simpleExpression expression) varMap = ((Boolean (fst((simpleExpressionEval simpleExpression varMap)) == (fst(expressionEval expression varMap)))), varMap)
expressionEval (ExpressionMultipleNE simpleExpression expression) varMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap)) /= (fst(expressionEval expression varMap)))), varMap)
expressionEval (ExpressionMultipleLT simpleExpression expression) varMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap))) < (toFloat(fst(expressionEval expression varMap))))), varMap)
expressionEval (ExpressionMultipleLTE simpleExpression expression) varMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap))) <= (toFloat(fst(expressionEval expression varMap))))), varMap)
expressionEval (ExpressionMultipleGT simpleExpression expression) varMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap))) > (toFloat(fst(expressionEval expression varMap))))), varMap)
expressionEval (ExpressionMultipleGTE simpleExpression expression) varMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap))) >= (toFloat(fst(expressionEval expression varMap))))), varMap)
expressionEval (ExpressionMultipleIN simpleExpression expression) varMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap)) == (fst(expressionEval expression varMap)))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "In" YET ---------------------------------------------------

actualParameterEval :: ActualParameter -> VariableMap -> (Val, VariableMap)
actualParameterEval (ActualParameterSingle expression ) varMap = (fst(expressionEval expression varMap), varMap)
actualParameterEval (ActualParameterMultiple actualParameter expression) varMap= ((Real(1.4)), varMap)

parameterListEval :: ParameterList -> VariableMap -> (Val, VariableMap)
parameterListEval (ParameterListSingle x) varMap = (fst(actualParameterEval x varMap ), varMap)
parameterListEval (ParameterListMulitiple y x) varMap = ((Id (concat (valToStr (fst(parameterListEval y varMap)), valToStr (fst(actualParameterEval x varMap))))), varMap)

procedureStatementEval :: ProcedureStatement -> VariableMap-> (Val, VariableMap)
procedureStatementEval (SingleProcedureStatement str) varMap = ((Real (0.11)), varMap)
procedureStatementEval (MultiProcedureStatement "writeln" x) varMap = (fst(parameterListEval x varMap), varMap)

simpleStatementEval :: SimpleStatement -> VariableMap -> (Val, VariableMap)
simpleStatementEval (PS ps) varMap = (fst(procedureStatementEval ps varMap), varMap)

ifStatementEval :: IfStatement -> VariableMap -> (String, VariableMap)
ifStatementEval (IfState expression statement) varMap = ((if (toBool(fst(expressionEval expression varMap))) then (fst(statementEval varMap statement )) else ""), varMap)
ifStatementEval (IfStateElse expression statement1 statement2) varMap = ((if (toBool(fst(expressionEval expression varMap))) then (fst(statementEval varMap statement1 )) else (fst(statementEval varMap statement2 ))), varMap)

--constListEval :: ConstList -> Val
--constListEval (ConstListSingle x) = constantEval x

--constantEval :: Constant -> Val
--constantEval (ConstantUN unsignedNumber) = unsignedNumberEval unsignedNumber

--caseListElementEval :: CaseListElement -> (Val,Val)
--caseListElementEval (CaseListElementSingle const statement) = (constListEval const, Id (statementEval statement) )

--caseListElementsEval :: CaseListElements -> [(Val, Val)]
--caseListElementsEval (CaseListElementsSingle element ) = [caseListElementEval element]
--caseListElementsEval (CaseListElementsMultiple element case_list ) = (caseListElementEval element : caseListElementsEval case_list)

caseListElements_eval :: CaseListElements -> VariableMap -> ([(Val, Val)], VariableMap)
caseListElements_eval (CaseListElementsSingle element ) varMap = (([fst(caseListElement_eval element varMap)]), varMap)
caseListElements_eval (CaseListElementsMultiple element case_list ) varMap=  (((concat [fst(caseListElement_eval element varMap) : (fst(caseListElements_eval case_list varMap))])), varMap)

caseListElement_eval :: CaseListElement -> VariableMap-> ((Val, Val), VariableMap)
caseListElement_eval (CaseListElementSingle const statement) varMap= (((fst(constList_eval const varMap), Id (fst(statementEval varMap statement )) )), varMap)

constList_eval :: ConstList -> VariableMap-> (Val, VariableMap)
constList_eval (ConstListSingle x) varMap= ((fst(constant_eval x varMap), varMap))

constant_eval :: Constant -> VariableMap-> (Val, VariableMap)
constant_eval (ConstantUN unsignedNumber) varMap = ((unsignedNumberEval unsignedNumber), varMap)


removeIndex :: [(Val, Val)] -> Int ->[(Val, Val)]
removeIndex xs n = fst notGlued ++ snd notGlued
    where notGlued = (take (n-1) xs, drop n xs)

caseStatementEval :: CaseStatement -> VariableMap -> (String, VariableMap)
caseStatementEval (Case expression case_list) varMap =  ((if  (fst(expressionEval expression varMap) == (fst(head (fst(caseListElements_eval case_list varMap))))) 
                                                            then (valToStr (snd(head(fst(caseListElements_eval case_list varMap)))))
                                                            else (fst(caseStatementEval (CaseBreakDown expression (removeIndex (fst(caseListElements_eval case_list varMap)) 1))varMap))
                                                            ), varMap)
caseStatementEval (CaseBreakDown expression case_list) varMap=  ((if  (fst(( expressionEval expression varMap)) == (fst(head (case_list)))) 
                                                            then (valToStr(snd(head(case_list))))
                                                             else (fst(caseStatementEval (CaseBreakDown expression(removeIndex case_list 1)) varMap))
                                                            ), varMap)
--caseStatementEval (Case expression case_list) =  case  (toFloat(expressionEval expression)) of (toFloat(fst(head(caseListElements_eval case_list)))) -> (snd(head(caseListElements_eval case_list)))
--caseStatementEval (Case Expression CaseListElements) =
--caseStatementEval (CaseElse Expression CaseListElements [Statement]) =

conditionalStatementEval :: ConditionalStatement -> VariableMap-> (Val, VariableMap)
conditionalStatementEval (ConditionalStatementIf ifStatement) varMap = ((Id (fst(ifStatementEval ifStatement varMap))), varMap)
conditionalStatementEval (ConditionalStatementCase caseStatement) varMap = ((Id (fst(caseStatementEval caseStatement varMap))), varMap)

--repetetiveStatementEval :: RepetetiveStatement -> Val

--withStatementEval :: WithStatement -> Val

structuredStatementEval :: StructuredStatement -> VariableMap -> (Val, VariableMap)
--structuredStatementEval (StructuredStatementCompoundStatement statementArray) =
structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) varMap = (fst(conditionalStatementEval conditionalStatement varMap), varMap)
--structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement) =
--structuredStatementEval ( StructuredStatementWithStatement withStatement) =

unlabelledStatementEval :: UnlabelledStatement -> VariableMap-> (Val, VariableMap)
unlabelledStatementEval (UnlabelledStatementSimpleStatement simpleStatement) varMap= (fst(simpleStatementEval simpleStatement varMap), varMap)
unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) varMap= (fst(structuredStatementEval structuredStatement varMap), varMap)

statementEval ::  VariableMap -> Statement ->(String, VariableMap)
statementEval varMap(StatementUnlabelledStatement us)  = (valToStr (fst(unlabelledStatementEval us varMap)), varMap)

--statementToString :: [Statement] -> VariableMap-> ([String], VariableMap)
--statementToString (x) varMap= ((map (fst(statementToStringHelper varMap)) x), varMap)

--statementsEvalHelper :: [Statement] ->

statementsEval :: Statements -> VariableMap -> ([String], VariableMap)
statementsEval (StatementsSingle x) varMap = ([fst(statementEval varMap x )], varMap)
statementsEval (StatementsMultiple x y) varMap = (concat[[fst(statementEval varMap x )], (fst(statementsEval y varMap))], snd(statementsEval y varMap)) --show (traverse (statementEval x)) ]


variableDeclarationEval :: VariableDeclaration -> VariableMap -> VariableMap
variableDeclarationEval (VariableDeclarationMainBool str) varMap =    (Map.insert (head(str)) (Real 1.0) varMap) --("Bool", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainReal str) varMap =  (Map.insert (head(str)) (Real 1.0) varMap) --("Real", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainString str) varMap =  (Map.insert (head(str)) (Real 1.0) varMap) --("String", Boolean True) varMap) 

variableDeclarationPartEval :: VariableDeclarationPart -> VariableMap -> VariableMap
variableDeclarationPartEval (VariableDeclarationPartSingle variableDeclaration ) varMap = variableDeclarationEval variableDeclaration varMap
variableDeclarationPartEval (VariableDeclarationPartMultiple variableDeclaration variableDeclarationPartMultiple) varMap = variableDeclarationEval variableDeclaration varMap
--Have not implemented multiple variables yet just single


blockOptionsEval :: BlockOptions -> VariableMap
blockOptionsEval (BlockOptionsVariableDeclarationPart variableDeclarationPart) = variableDeclarationPartEval variableDeclarationPart Map.empty

blockEval :: Block -> [String]
blockEval (BlockCopoundStatement s ) = fst(statementsEval s Map.empty)
blockEval (BlockVariableDeclarationPart b s) = fst(statementsEval s (blockOptionsEval b))
blockEval (Block_Method procedureAndFunctionDeclarationPart statements) = ["hi", "ds"]
blockEval (Block_Variable_Method blockOptions procedureAndFunctionDeclarationPart statements) =["hi", "ds"] 

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = (concat(blockEval block))

interpret _ = "Not implemented"
