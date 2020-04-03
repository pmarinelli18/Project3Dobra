module Pascal.Interpret 
(
    interpret,
    unsignedNumberEval,
    unsignedConstantEval,
    functionDesignatorEval,
    procedureOrFunctionDeclarationEval,
    variableEval,
    factorEval,
    signedFactorEval,
    termEval,
    simpleExpressionEval,
    expressionEval,
    actualParameterEval,
    parameterListEval,
    procedureStatementEval,
    simpleStatementEval,
    assignmentStatementEval,
    ifStatementEval,
    caseListElements_eval,
    caseListElement_eval,
    constList_eval,
    constant_eval,
    removeIndex,
    caseStatementEval,
    conditionalStatementEval,
    structuredStatementEval,
    repetetiveStatement_eval,
    forStatement_eval,
    forStatement_evalHelper,
    whileStatement_eval,
    unlabelledStatementEval,
    statementEval,
    statementsEval,
    variableDeclarationEval,
    variableDeclarationPartMultipleEval,
    variableDeclarationPartEval,
    blockOptionsEval,
    procedureDeclarationEvalString,
    functionDeclarationEvalString,
    procedureOrFunctionDeclarationEvalString,
    procedureAndFunctionDeclarationPartEval,
    blockEval

)
where

--import Pascal.Val
import Pascal.Data
import Pascal.Val
import qualified Data.Map as Map
import Data.Maybe
import Data.List


type VariableMap = [Map.Map String Val] --Map.Map String (String, Val)
type FunctionAndProcedureMap = Map.Map String ProcedureOrFunctionDeclaration


unsignedNumberEval :: UnsignedNumber -> Val
unsignedNumberEval (UI int) = Integer int
unsignedNumberEval (UR float) = Real float

unsignedConstantEval :: UnsignedConstant -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
unsignedConstantEval (UN unsignedNumber) varMap  pfMap= (unsignedNumberEval unsignedNumber, varMap)
unsignedConstantEval (Str str) varMap  pfMap= ((Id str), varMap)
unsignedConstantEval (Nil) varMap pfMap= ((Id ("Nil")), varMap)

functionDesignatorEval :: FunctionDesignator -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
functionDesignatorEval (FDesignate "cos" parameterList) varMap pfMap = ((Real (cos(toFloat(fst(parameterListEval parameterList varMap pfMap))))), varMap)
functionDesignatorEval (FDesignate "sin" parameterList) varMap pfMap = ((Real (sin(toFloat(fst(parameterListEval parameterList varMap pfMap))))), varMap)
functionDesignatorEval (FDesignate "sqrt" parameterList) varMap pfMap = ((Real (sqrt(toFloat(fst(parameterListEval parameterList varMap pfMap))))), varMap)
functionDesignatorEval (FDesignate "ln" parameterList) varMap pfMap = ((Real (log(toFloat(fst(parameterListEval parameterList varMap pfMap))))), varMap)
functionDesignatorEval (FDesignate "dopower" parameterList) varMap pfMap = ((Real (cos(toFloat(fst(parameterListEval parameterList varMap pfMap))))), varMap)
functionDesignatorEval (FDesignate x parameterList) varMap pfMap = (
    (fst(procedureOrFunctionDeclarationEval (fromJust(Map.lookup  ((x)) pfMap)) varMap pfMap parameterList))
    , snd(procedureOrFunctionDeclarationEval (fromJust(Map.lookup  ((x)) pfMap)) varMap pfMap parameterList))


procedureOrFunctionDeclarationEval :: ProcedureOrFunctionDeclaration  -> VariableMap -> FunctionAndProcedureMap -> ParameterList -> (Val, VariableMap)
procedureOrFunctionDeclarationEval( Procedure_method procedureDeclaration)varMap pfMap parameterList= 
    (fst (procedureDeclarationEval procedureDeclaration varMap pfMap parameterList), varMap)
procedureOrFunctionDeclarationEval (Function_method functionDeclaration)varMap pfMap parameterList= 
    (fst (functionDeclarationEval functionDeclaration varMap pfMap parameterList), varMap)

procedureDeclarationEval:: ProcedureDeclaration -> VariableMap -> FunctionAndProcedureMap -> ParameterList-> (Val, VariableMap)
procedureDeclarationEval (Procedure_no_identifier string block) varMap pfMap parameterList= 
    ((Id(concat(fst(blockEval block varMap pfMap)))), varMap)
procedureDeclarationEval (Procedure_with_identifier string formalParameterList  block) varMap pfMap parameterList= 
    ((Id(concat(fst(blockEval block     
    (formalParameterListEval formalParameterList (varMap ++ varMap) parameterList pfMap) 
    pfMap)))), varMap)

functionDeclarationEval:: FunctionDeclaration -> VariableMap -> FunctionAndProcedureMap -> ParameterList-> (Val, VariableMap)
functionDeclarationEval (Function_no_identifier string1 string2 block) varMap pfMap  parameterList=
    ( fromJust(Map.lookup  (string1) ((last(snd(blockEval block [(Map.insert (string1) (Real 0.0) (last varMap))] pfMap))))), varMap)

    --(head(fst(blockEval block varMap pfMap)), varMap)
    --((Id(concat(blockEval block varMap pfMap))), varMap)
functionDeclarationEval (Function_identifier string1 formalParameterList string2  block) varMap pfMap parameterList=
    ( fromJust(Map.lookup  (string1) (last(snd(blockEval block [(Map.insert (string1) (Real 0.0) (last(formalParameterListEval formalParameterList (varMap) parameterList pfMap)))] 
     pfMap)))), varMap)
    --( fromJust(Map.lookup  (string1) (last(snd(blockEval block ((take ((length varMap) -1) varMap) ++ [(Map.insert (string1) (Real 3.0) (last varMap))]) pfMap)))), varMap)
    
    
    -- (head(fst(blockEval block (formalParameterListEval formalParameterList (varMap ++ varMap) parameterList pfMap) 
    -- pfMap)), varMap)
    -- ((Id(concat(blockEval block 
    -- (formalParameterListEval formalParameterList (varMap ++ varMap) parameterList pfMap) 
    -- pfMap))), varMap)

formalParameterListEval:: FormalParameterList ->VariableMap -> ParameterList-> FunctionAndProcedureMap ->VariableMap
formalParameterListEval (Singleparameter formalParameterSection) varMap parameterList pfMap= 
    formalParameterSectionEval formalParameterSection varMap parameterList pfMap
formalParameterListEval (Multipleparameter formalParameterSection formalParameterList) varMap parameterList pfMap= 
    (varMap ++ [(Map.union (last (formalParameterSectionEval formalParameterSection varMap parameterList pfMap)) (last (formalParameterListEval formalParameterList varMap parameterList pfMap)))])
   -- (formalParameterListEval (formalParameterList (formalParameterSectionEval formalParameterSection varMap)))

formalParameterSectionEval :: FormalParameterSection ->VariableMap -> ParameterList-> FunctionAndProcedureMap->VariableMap
formalParameterSectionEval (Simple_parameterGroup parameterGroup) varMap parameterList pfMap= (parameterGroupEval parameterGroup varMap parameterList pfMap)
formalParameterSectionEval (Var_parameterGroup parameterGroup) varMap parameterList pfMap= (parameterGroupEval parameterGroup varMap parameterList pfMap)

parameterGroupEval :: ParameterGroup ->VariableMap -> ParameterList -> FunctionAndProcedureMap->VariableMap
parameterGroupEval (Parameter_groupString stringArray) varMap parameterList pfMap=    (take ((length varMap) -1) varMap) 
    ++ [(Map.insert (head stringArray) (fst(parameterListEval parameterList varMap pfMap)) (last varMap))]
parameterGroupEval (Parameter_groupReal stringArray) varMap parameterList pfMap=    (take ((length varMap) -1) varMap) 
    ++ [(Map.insert (head stringArray) (fst(parameterListEval parameterList varMap pfMap)) (last varMap))]
parameterGroupEval (Parameter_groupBool stringArray) varMap parameterList pfMap =    (take ((length varMap) -1) varMap) 
    ++ [(Map.insert (head stringArray) (fst(parameterListEval parameterList varMap pfMap)) (last varMap))]

-- forStatement_eval (ForTo identifier expressionIn expressionF statement) varMap pfMap= 
--      ((fst(forStatement_evalHelper identifier (toInt(fst(expressionEval expressionF varMap pfMap))) statement 
--      (varMap ++ [(Map.insert(identifier) ((fst(expressionEval expressionIn varMap pfMap))) (last varMap))]) pfMap)), varMap)

-- assignmentStatementEval (AssignmentStatementMain variable expression ) varMap pfMap = (take ((length varMap) -1) varMap) 
--     ++ [(Map.insert (variableEval variable) ((fst(expressionEval expression varMap pfMap))) (last varMap))]
-- assignmentStatementEval (AssignmentStatementValue variable value ) varMap pfMap = (take ((length varMap) -1) varMap) 
--     ++ [(Map.insert (variableEval variable) ((value)) (last varMap))]


---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Dopower" YET Maybe havnt tested it yet ---------------------------------------------------


variableEval :: Variable -> String
variableEval (Var string) = string


factorEval :: Factor -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)    --Add boolean to Val in Val.hs
factorEval (FactorVariable variable) varMap  pfMap=     (( fromJust(Map.lookup  ((variableEval variable)) (last varMap))), varMap)
factorEval (FactorExpression expression) varMap pfMap =  (fst(expressionEval expression varMap pfMap), varMap)
factorEval (FactorFD functionDesignator) varMap pfMap =  (fst(functionDesignatorEval functionDesignator varMap pfMap), snd(functionDesignatorEval functionDesignator varMap pfMap))
factorEval (FactorUC unsignedConstant) varMap pfMap =  (fst(unsignedConstantEval unsignedConstant varMap pfMap), snd(unsignedConstantEval unsignedConstant varMap pfMap))
factorEval (FactorSe set) varMap pfMap = ((Real (5.0)), varMap)
factorEval (FactorNot factor) varMap pfMap = ((Real (6.0)), varMap)
factorEval (FactorBool bool) varMap pfMap = (Boolean(bool), varMap) 

signedFactorEval :: SignedFactor -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
signedFactorEval (SignedFactorDefault factor) varMap  pfMap= (fst(factorEval factor varMap pfMap), snd(factorEval factor varMap pfMap))
signedFactorEval (SignedFactorPlus factor) varMap pfMap = (fst(factorEval factor varMap pfMap), snd(factorEval factor varMap pfMap))
signedFactorEval (SignedFactorMinus factor) varMap pfMap = (Real( -1 *(toFloat((fst(factorEval factor varMap pfMap))))), snd(factorEval factor varMap pfMap))



termEval :: Term -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
termEval (TermSingle signedFactor) varMap pfMap = (fst(signedFactorEval signedFactor varMap pfMap), snd(signedFactorEval signedFactor varMap pfMap))
termEval (TermMultipleMult signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap pfMap) )) * (toFloat(fst(termEval term varMap pfMap))))), varMap)
termEval (TermMultipleDivision signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap  pfMap))) / (toFloat(fst(termEval term varMap pfMap ))))), varMap)
termEval (TermMultipleDiv signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap pfMap))) / (toFloat(fst(termEval term varMap pfMap))))), varMap)
termEval (TermMultipleMod signedFactor term) varMap pfMap = ((Integer(( mod (toInt (fst(signedFactorEval signedFactor varMap pfMap)))  (toInt(fst(termEval term varMap pfMap)))))), varMap)--Integer((toInt(signedFactorEval signedFactor)) `mod` (toInt(termEval term)))
termEval (TermMultipleAnd signedFactor term) varMap pfMap = ((Boolean((toBool (fst(signedFactorEval signedFactor varMap pfMap))) && (toBool(fst(termEval term varMap pfMap))))), varMap)

---------------------------------------------DID NOT ADD FUNCTIONALITY TO "mod" YET Maybe havnt tested it yet ---------------------------------------------------

simpleExpressionEval :: SimpleExpression -> VariableMap -> FunctionAndProcedureMap ->(Val, VariableMap)
simpleExpressionEval (SingleExpressionTermSingle term) varMap  pfMap= (fst(termEval term varMap pfMap),snd(termEval term varMap pfMap))
simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) + (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) - (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap  pfMap= ((Boolean((toBool (fst(termEval term varMap pfMap))) || (toBool (fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "Or" YET Maybe havnt tested it yet ---------------------------------------------------


expressionEval :: Expression -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
expressionEval (ExpressionSingle simpleExpression ) varMap  pfMap= (fst(simpleExpressionEval simpleExpression varMap pfMap), snd(simpleExpressionEval simpleExpression varMap pfMap))
expressionEval (ExpressionMultipleE simpleExpression expression) varMap  pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) == (fst(expressionEval expression varMap pfMap)))), varMap)
expressionEval (ExpressionMultipleNE simpleExpression expression) varMap pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) /= (fst(expressionEval expression varMap pfMap)))), varMap)
expressionEval (ExpressionMultipleLT simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) < (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
expressionEval (ExpressionMultipleLTE simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) <= (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
expressionEval (ExpressionMultipleGT simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) > (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
expressionEval (ExpressionMultipleGTE simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) >= (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
expressionEval (ExpressionMultipleIN simpleExpression expression) varMap pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) == (fst(expressionEval expression varMap pfMap)))), varMap)
---------------------------------------------DID NOT ADD FUNCTIONALITY TO "In" YET ---------------------------------------------------

actualParameterEval :: ActualParameter -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
actualParameterEval (ActualParameterSingle expression ) varMap pfMap = (fst(expressionEval expression varMap pfMap), snd(expressionEval expression varMap pfMap))
actualParameterEval (ActualParameterMultiple actualParameter expression) varMap pfMap= ((Real(1.4)), varMap)

parameterListEval :: ParameterList -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
parameterListEval (ParameterListSingle x) varMap pfMap = (fst(actualParameterEval x varMap  pfMap), snd(actualParameterEval x varMap pfMap ))
parameterListEval (ParameterListMulitiple y x) varMap pfMap = ((Id ((valToStr (fst(parameterListEval y varMap pfMap))++ valToStr (fst(actualParameterEval x varMap pfMap))))), snd(parameterListEval y varMap pfMap))

procedureStatementEval :: ProcedureStatement -> VariableMap-> FunctionAndProcedureMap -> (Val, VariableMap)
procedureStatementEval (MultiProcedureStatement "writeln" x) varMap  pfMap= ( (Id( (valToStr(fst(parameterListEval x varMap pfMap)) ++ "#&#!" )) ), snd(parameterListEval x varMap pfMap))
procedureStatementEval (SingleProcedureStatement) varMap  pfMap= (Id "break", varMap)
procedureStatementEval (MultiProcedureStatement str x) varMap  pfMap=((fst(procedureOrFunctionDeclarationEval (fromJust(Map.lookup  ((str)) pfMap)) varMap pfMap x))
    , (snd(procedureOrFunctionDeclarationEval (fromJust(Map.lookup  ((str)) pfMap)) varMap pfMap x)))

simpleStatementEval :: SimpleStatement -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
simpleStatementEval (PS ps) varMap  pfMap= (fst(procedureStatementEval ps varMap pfMap), snd(procedureStatementEval ps varMap pfMap))
simpleStatementEval (SimpleStatementAssignment assignmentStatement) varMap  pfMap= (Id "", (assignmentStatementEval assignmentStatement varMap pfMap))



assignmentStatementEval :: AssignmentStatement -> VariableMap -> FunctionAndProcedureMap -> VariableMap
assignmentStatementEval (AssignmentStatementMain variable expression ) varMap pfMap = (take ((length varMap) -1) varMap) 
    ++ [(Map.insert (variableEval variable) ((fst(expressionEval expression varMap pfMap))) (last varMap))]
assignmentStatementEval (AssignmentStatementValue variable value ) varMap pfMap = (take ((length varMap) -1) varMap) 
    ++ [(Map.insert (variableEval variable) ((value)) (last varMap))]

--(Map.insert (head(str)) (Real 1.0) varMap)

ifStatementEval :: IfStatement -> VariableMap -> FunctionAndProcedureMap -> (String, VariableMap)
ifStatementEval (IfState expression statement) varMap  pfMap= ((if (toBool(fst(expressionEval expression varMap pfMap))) then ((fst(statementEval varMap statement pfMap ),snd(statementEval varMap statement pfMap ))) else ("", varMap)))
ifStatementEval (IfStateElse expression statement1 statement2) varMap  pfMap= ((if (toBool(fst(expressionEval expression varMap pfMap))) then ((fst(statementEval varMap statement1 pfMap ), snd(statementEval varMap statement1 pfMap ))) else ((fst(statementEval varMap statement2  pfMap ), snd(statementEval varMap statement2  pfMap)))))

--constListEval :: ConstList -> Val
--constListEval (ConstListSingle x) = constantEval x

--constantEval :: Constant -> Val
--constantEval (ConstantUN unsignedNumber) = unsignedNumberEval unsignedNumber

--caseListElementEval :: CaseListElement -> (Val,Val)
--caseListElementEval (CaseListElementSingle const statement) = (constListEval const, Id (statementEval statement) )

caseListElements_eval :: CaseListElements -> VariableMap -> FunctionAndProcedureMap -> ([(Val, Val)], VariableMap)
caseListElements_eval (CaseListElementsSingle element ) varMap  pfMap= (([fst(caseListElement_eval element varMap pfMap)]), snd(caseListElement_eval element varMap pfMap))
caseListElements_eval (CaseListElementsMultiple element case_list ) varMap pfMap=  (((concat [fst(caseListElement_eval element varMap pfMap) : (fst(caseListElements_eval case_list varMap pfMap))])), snd(caseListElements_eval case_list varMap pfMap))

caseListElement_eval :: CaseListElement -> VariableMap->FunctionAndProcedureMap -> ((Val, Val), VariableMap)
caseListElement_eval (CaseListElementSingle const statement) varMap pfMap= (((fst(constList_eval const varMap pfMap), Id (fst(statementEval varMap statement  pfMap)) )), snd(statementEval varMap statement  pfMap))

constList_eval :: ConstList -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
constList_eval (ConstListSingle x) varMap pfMap= ((fst(constant_eval x varMap pfMap), snd(constant_eval x varMap pfMap)))

constant_eval :: Constant -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
constant_eval (ConstantUN unsignedNumber) varMap pfMap = ((unsignedNumberEval unsignedNumber), varMap)


removeIndex :: [(Val, Val)] -> Int ->[(Val, Val)]
removeIndex xs n = fst notGlued ++ snd notGlued
    where notGlued = (Prelude.take (n-1) xs, Prelude.drop n xs)

caseStatementEval :: CaseStatement -> VariableMap -> FunctionAndProcedureMap -> (String, VariableMap)
caseStatementEval (Case expression case_list) varMap pfMap=  ((if  (fst(expressionEval expression varMap pfMap) == (fst(head (fst(caseListElements_eval case_list varMap pfMap))))) 
                                                            then ((valToStr (snd(head(fst(caseListElements_eval case_list varMap pfMap))))), snd(caseListElements_eval case_list varMap pfMap))
                                                            else ((fst(caseStatementEval (CaseBreakDown expression (removeIndex (fst(caseListElements_eval case_list varMap pfMap)) 1))varMap  pfMap)),snd(caseListElements_eval case_list varMap pfMap))
                                                            ))
caseStatementEval (CaseBreakDown expression case_list) varMap pfMap=  (((if  (fst(( expressionEval expression varMap pfMap)) == (fst(head (case_list)))) 
                                                            then ((valToStr(snd(head(case_list)))))
                                                            else (fst(caseStatementEval (CaseBreakDown expression(removeIndex case_list 1)) varMap  pfMap))
                                                            )), (snd(caseStatementEval (CaseBreakDown expression(removeIndex case_list 1)) varMap  pfMap)))

conditionalStatementEval :: ConditionalStatement -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
conditionalStatementEval (ConditionalStatementIf ifStatement) varMap  pfMap= ((Id (fst(ifStatementEval ifStatement varMap pfMap))), snd(ifStatementEval ifStatement varMap pfMap))
conditionalStatementEval (ConditionalStatementCase caseStatement) varMap  pfMap= ((Id (fst(caseStatementEval caseStatement varMap pfMap))), snd(caseStatementEval caseStatement varMap pfMap))

structuredStatementEval :: StructuredStatement -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
structuredStatementEval (StructuredStatementCompoundStatement statementArray) varMap  pfMap= (Id (concat(fst(statementsEval statementArray varMap pfMap))), snd(statementsEval  statementArray varMap pfMap))
structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) varMap  pfMap= (fst(conditionalStatementEval conditionalStatement varMap pfMap), snd(conditionalStatementEval conditionalStatement varMap pfMap))
structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement)varMap  pfMap= repetetiveStatement_eval repetetiveStatement varMap pfMap
--structuredStatementEval ( StructuredStatementWithStatement withStatement) =

repetetiveStatement_eval :: RepetetiveStatement -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
repetetiveStatement_eval (RepetetiveStatementWhile whileT) varMap  pfMap= (Id(fst(whileStatement_eval whileT varMap pfMap)), snd(whileStatement_eval whileT varMap pfMap))
repetetiveStatement_eval (RepetetiveStatementFor forLoop) varMap  pfMap= (strToVal(fst(forStatement_eval forLoop varMap pfMap)), snd(forStatement_eval forLoop varMap pfMap))

forStatement_eval :: ForStatement -> VariableMap->FunctionAndProcedureMap -> (String, VariableMap)
forStatement_eval (ForTo identifier expressionIn expressionF statement) varMap pfMap= 
    ((fst(forStatement_evalHelper identifier (toInt(fst(expressionEval expressionF varMap pfMap))) statement 
    (varMap ++ [(Map.insert(identifier) ((fst(expressionEval expressionIn varMap pfMap))) (last varMap))]) pfMap)), varMap)

check::[Char]->[Char]->Bool
check [][]              =False
check _[]               =False
check []_               =False
check(x:xs)(y:ys)
 | y == x               =True -- this line
 | otherwise            =check xs (y:ys)

forStatement_evalHelper :: String -> Int -> Statement -> VariableMap -> FunctionAndProcedureMap -> (String, VariableMap)
forStatement_evalHelper identifier expressionTo statement varMap  pfMap= 
    if(toInt( fromJust(Map.lookup  ((identifier)) (last varMap))) >= (expressionTo)) 
    then  ("", varMap)   
    else (
    (if (check "break" (fst(statementEval varMap statement pfMap))  )
    then
    (fst(statementEval varMap statement pfMap ), snd(statementEval varMap statement pfMap ))
    else
    ((fst(statementEval varMap statement pfMap )) ++ (fst(forStatement_evalHelper identifier expressionTo  statement 
    (assignmentStatementEval (AssignmentStatementValue (Var identifier) 
    (Integer ((toInt( fromJust(Map.lookup  ((identifier)) (last varMap)))) + 1)))
    (snd(statementEval varMap statement  pfMap)) pfMap) pfMap))
    , snd(forStatement_evalHelper identifier expressionTo  statement (snd(statementEval varMap statement  pfMap))  pfMap))))
                        -- else ( statementEval statement ++ (forStatement_eval (ForLoop identifier expressionIn expressionF  statement )) )
                         -- Real(toFloat(expressionEval expressionIn)+1)



whileStatement_eval :: WhileStatement -> VariableMap -> FunctionAndProcedureMap -> (String, VariableMap)
whileStatement_eval (WhileS expression statement) varMap pfMap= 
                        if(toBool(fst(expressionEval expression varMap pfMap))) then 
                             (fst(statementEval varMap statement  pfMap)  ++
                             (fst(whileStatement_eval (WhileS expression statement) (snd(statementEval varMap statement  pfMap)) pfMap)),
                              snd(whileStatement_eval (WhileS expression statement) (snd(statementEval varMap statement  pfMap)) pfMap) 
                              )
                             else ("", varMap) -- then Id (statementEval statement)  else Real(77) 

unlabelledStatementEval :: UnlabelledStatement -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
unlabelledStatementEval (UnlabelledStatementSimpleStatement simpleStatement) varMap pfMap= (fst(simpleStatementEval simpleStatement varMap pfMap), snd(simpleStatementEval simpleStatement varMap pfMap))
unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) varMap pfMap= (fst(structuredStatementEval structuredStatement varMap pfMap), snd(structuredStatementEval structuredStatement varMap pfMap))

statementEval ::  VariableMap -> Statement -> FunctionAndProcedureMap ->(String, VariableMap)
statementEval varMap(StatementUnlabelledStatement us)   pfMap= (valToStr (fst(unlabelledStatementEval us varMap pfMap)), snd(unlabelledStatementEval us varMap pfMap))

statementsEval :: Statements -> VariableMap -> FunctionAndProcedureMap -> ([String], VariableMap)
statementsEval (StatementsSingle x) varMap pfMap = ([fst(statementEval varMap x  pfMap)], snd(statementEval varMap x  pfMap))
statementsEval (StatementsMultiple x y) varMap pfMap = (concat[[fst(statementEval varMap x pfMap )], (fst(statementsEval y (snd(statementEval varMap x  pfMap)) pfMap))], snd(statementsEval y varMap pfMap)) --show (traverse (statementEval x)) ]


variableDeclarationEval :: VariableDeclaration -> Map.Map String Val -> Map.Map String Val
variableDeclarationEval (VariableDeclarationMainBool str) varMap =    (Map.insert (head(str)) (Boolean True) varMap) --("Bool", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainReal str) varMap =  (Map.insert (head(str)) (Real 0.0) varMap) --("Real", Boolean True) varMap) 
variableDeclarationEval (VariableDeclarationMainString str) varMap =  (Map.insert (head(str)) (Id "") varMap) --("String", Boolean True) varMap) 


variableDeclarationPartMultipleEval :: VariableDeclarationPartMultiple -> Map.Map String Val -> Map.Map String Val
variableDeclarationPartMultipleEval (VariableDeclarationPartMultipleSingle variableDeclaration ) varMap = variableDeclarationEval variableDeclaration varMap
variableDeclarationPartMultipleEval (VariableDeclarationPartMultipleMultiple variableDeclaration variableDeclarationPartMultiple) varMap =  Map.union (variableDeclarationEval variableDeclaration varMap) (variableDeclarationPartMultipleEval variableDeclarationPartMultiple varMap) 


variableDeclarationPartEval :: VariableDeclarationPart -> Map.Map String Val -> Map.Map String Val
variableDeclarationPartEval (VariableDeclarationPartSingle variableDeclaration ) varMap = variableDeclarationEval variableDeclaration varMap
variableDeclarationPartEval (VariableDeclarationPartMultiple variableDeclaration variableDeclarationPartMultiple) varMap =  Map.union (variableDeclarationEval variableDeclaration varMap) (variableDeclarationPartMultipleEval variableDeclarationPartMultiple varMap) 
--Have not implemented multiple variables yet just single

blockOptionsEval :: BlockOptions -> Map.Map String Val
blockOptionsEval (BlockOptionsVariableDeclarationPart variableDeclarationPart) = variableDeclarationPartEval variableDeclarationPart Map.empty

procedureDeclarationEvalString :: ProcedureDeclaration -> String
procedureDeclarationEvalString (Procedure_no_identifier string block) = string
procedureDeclarationEvalString (Procedure_with_identifier string formalParameterList block) = string

functionDeclarationEvalString :: FunctionDeclaration -> String
functionDeclarationEvalString (Function_no_identifier string string1 block) = string
functionDeclarationEvalString (Function_identifier string formalParameterList string1 block) = string


procedureOrFunctionDeclarationEvalString :: ProcedureOrFunctionDeclaration ->  String
procedureOrFunctionDeclarationEvalString (Procedure_method procedureDeclaration)= procedureDeclarationEvalString procedureDeclaration
procedureOrFunctionDeclarationEvalString (Function_method functionDeclaration)= functionDeclarationEvalString functionDeclaration

procedureAndFunctionDeclarationPartEval :: ProcedureAndFunctionDeclarationPart -> Map.Map String ProcedureOrFunctionDeclaration -> Map.Map String ProcedureOrFunctionDeclaration
procedureAndFunctionDeclarationPartEval (Declaration p) pfMap = (Map.insert (procedureOrFunctionDeclarationEvalString p) p pfMap)



blockEval :: Block -> VariableMap->FunctionAndProcedureMap  -> ([String], VariableMap) 
blockEval (BlockCopoundStatement s ) varMap pfMap = (fst(statementsEval s varMap pfMap), snd(statementsEval s varMap pfMap))
blockEval (BlockVariableDeclarationPart b s) varMap pfMap = (fst(statementsEval s ([blockOptionsEval b]) pfMap), snd(statementsEval s ([blockOptionsEval b]) pfMap))
blockEval (Block_Method p s) varMap pfMap = (fst(statementsEval s varMap (procedureAndFunctionDeclarationPartEval p  pfMap)) , snd(statementsEval s varMap (procedureAndFunctionDeclarationPartEval p  pfMap)))
blockEval (Block_Variable_Method b p s) varMap pfMap = (fst(statementsEval s ([blockOptionsEval b]) (procedureAndFunctionDeclarationPartEval p pfMap)), snd(statementsEval s ([blockOptionsEval b]) (procedureAndFunctionDeclarationPartEval p pfMap)))

interpret :: Program -> String
-- TODO: write the interpreter
interpret (ProgramBlock programheading block) = (replace ( removePunc2 ((concat(fst( blockEval block [Map.empty] Map.empty)))) ) "#&#!" "\n")

interpret _ = "Not implemented"
