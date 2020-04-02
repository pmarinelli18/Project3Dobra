-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val
import Pascal.Data
import Pascal.Interpret

import qualified Data.Map as Map
import Data.Maybe
import Data.List
type VariableMap = [Map.Map String Val] 


main :: IO ()
main = hspec $ do
  describe "Unsigned Numebr Eval" $ do
    it "test Unsigned" $ do
      unsignedNumberEval (UI 5)  `shouldBe` (Integer (5))
      unsignedNumberEval (UR 5)  `shouldBe` (Real (5.0))

  describe "Variable Eval" $ do
    it "Test Variable" $ do
      variableEval (Var "Hello") `shouldBe` "Hello"
  
  describe "unsigned Constant Eval" $ do
    it "test Unsigned Constant" $ do
      unsignedConstantEval (UN (UI 5)) [Map.empty] Map.empty `shouldBe` (Integer 5, [Map.empty])
      unsignedConstantEval (UN (UR 5)) [Map.empty] Map.empty `shouldBe` (Real 5, [Map.empty])
      unsignedConstantEval (Str "something") [Map.empty] Map.empty `shouldBe` (Id "something", [Map.empty])
      unsignedConstantEval (Nil) [Map.empty] Map.empty `shouldBe` ((Id ("Nil")), [Map.empty])

--       unsignedConstantEval :: UnsignedConstant -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
-- unsignedConstantEval (UN unsignedNumber) varMap  pfMap= (unsignedNumberEval unsignedNumber, varMap)
-- unsignedConstantEval (Str str) varMap  pfMap= ((Id str), varMap)
-- unsignedConstantEval (Nil) varMap pfMap= ((Id ("Nil")), varMap)



--  describe "Expression Eval" $ do
--    it "Expression Eval" $ do
--      expressionEval (ExpressionSingle simpleExpression ) varMap  pfMap= (fst(simpleExpressionEval simpleExpression varMap pfMap), snd(simpleExpressionEval simpleExpression varMap pfMap))



  describe "Signed Factor Eval" $ do
    it "Signed Factor Eval Negative" $ do
      signedFactorEval (SignedFactorMinus ( FactorUC (UN (UI 5)) )) [Map.empty] Map.empty  `shouldBe` (Real(-5), [Map.empty])
    it "Signed Factor Positive" $ do
      signedFactorEval (SignedFactorPlus (FactorUC (UN (UI 5)) )) [Map.empty] Map.empty `shouldBe` (Integer(5), [Map.empty])
    it "Signed Factor Eval default" $ do
      signedFactorEval (SignedFactorDefault (FactorUC (UN (UI 5))) ) [Map.empty] Map.empty `shouldBe`(Integer(5), [Map.empty])
      


  describe "Factor Eval" $ do
    it "Factor Eval variable" $ do
      let myMap = Map.fromList [("hello", Real(1)), ("hi", Real(32))]
        --let tap4 = Map.fromList[("hay",myMap)]
      factorEval (((FactorVariable (Var "hello")) )) [myMap] Map.empty `shouldBe`   (Real(1), [myMap]) 
    it "Factor Eval Integer" $ do
      factorEval ( FactorUC (UN (UI 5)) ) [Map.empty] Map.empty `shouldBe` (Integer(5), [Map.empty])
    it "Factor Bool Eval" $ do
      factorEval (FactorBool True ) [Map.empty] Map.empty `shouldBe`  (Boolean(True), [Map.empty]) 
    -- it "Factor factor" $ do
    --   factorEval (FactorNot factor)  [Map.empty] Map.empty `shouldBe` ((Real (6.0)), [Map.empty])


  describe "term eval" $ do
    it "term signed factor simple" $ do
        termEval (TermSingle (  SignedFactorMinus ( FactorUC (UN (UI 5))))) [Map.empty] Map.empty `shouldBe` (Real (-5.0),[ Map.empty])
    it "term signed factor Multiple" $ do
        termEval (TermMultipleMult (  SignedFactorMinus ( FactorUC (UN (UI 5)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 20)))) )) [Map.empty] Map.empty `shouldBe` (Real (-100.0),[Map.empty])
    it "term signed factor Division alternative" $ do
        termEval (TermMultipleDivision (  SignedFactorMinus ( FactorUC (UN (UI 934)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 10)))) )) [Map.empty] Map.empty  `shouldBe` (Real (-93.4),[Map.empty])
    it "term signed factor Division" $ do
        termEval (TermMultipleDiv (  SignedFactorMinus ( FactorUC (UN (UI 82)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 40)))) )) [Map.empty] Map.empty  `shouldBe` (Real (-2.05),[Map.empty])
    it "term signed factor module" $ do
        termEval (TermMultipleMod  (  SignedFactorMinus ( FactorUC (UN (UI 8)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 3)))) )) [Map.empty] Map.empty  `shouldBe`  (Integer 1,[Map.empty])


  describe "Simple Expression" $ do
    it "Simple Expression" $ do
      simpleExpressionEval (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) [Map.empty] Map.empty  `shouldBe` ( Integer(45),[ Map.empty])
    it "Simple Multiple Add Expression" $ do
      simpleExpressionEval (SingleExpressionTermMultipleAdd (TermMultipleMult (  SignedFactorMinus ( FactorUC (UN (UI 25)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 20)))) )) (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45))))) ) )  [Map.empty] Map.empty `shouldBe`  (Real (-455.0),[Map.empty])
    it "Simple Dub Expression" $ do
      simpleExpressionEval (SingleExpressionTermMultipleSub (TermMultipleDiv (  SignedFactorMinus ( FactorUC (UN (UI 2)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 4)))) ))  (SingleExpressionTermMultipleAdd (TermMultipleMult (  SignedFactorMinus ( FactorUC (UN (UI 25)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 20)))) )) (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 25))))) ) )) [Map.empty] Map.empty `shouldBe`  ( Real 474.5,[Map.empty])
      
-- simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap  pfMap= ((Boolean((toBool (fst(termEval term varMap pfMap))) || (toBool (fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)

  describe "Expression Evaluator" $ do
    it "Expression Evaluator" $ do
      expressionEval (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) [Map.empty] Map.empty  `shouldBe` (Integer 35,[Map.empty])
    it "Expression Evaluator Equal" $ do
      expressionEval (ExpressionMultipleE (SingleExpressionTermMultipleSub (TermMultipleDiv (  SignedFactorMinus ( FactorUC (UN (UI 2)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 4)))) ))  (SingleExpressionTermMultipleAdd (TermMultipleMult (  SignedFactorMinus ( FactorUC (UN (UI 25)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 20)))) )) (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 25))))) ) ))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) [Map.empty] Map.empty `shouldBe` (Boolean False,[Map.empty])
    it "Expression Evaluator Not equal to " $ do
      expressionEval (ExpressionMultipleNE (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) ))) [Map.empty] Map.empty  `shouldBe` (Boolean True,[Map.empty])
    it "Expression Evaluator Less  Than " $ do
      expressionEval (ExpressionMultipleLT (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) ))) [Map.empty] Map.empty  `shouldBe` (Boolean False,[Map.empty])
    it "Expression Evaluator Less Equal Than " $ do
      expressionEval (ExpressionMultipleLTE (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45))))))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) [Map.empty] Map.empty  `shouldBe`  (Boolean False,[Map.empty])
    it "Expression Evaluator Greater  Than" $ do
      expressionEval (ExpressionMultipleGT (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45))))))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) [Map.empty] Map.empty  `shouldBe`  (Boolean True,[Map.empty])
    it "Expression Evaluator Greater Equal Than" $ do
      expressionEval (ExpressionMultipleGTE (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 100))))))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 135))))) )) ) [Map.empty] Map.empty  `shouldBe`  (Boolean False,[Map.empty])
    it "Expression Evaluator multiple In" $ do
      expressionEval (ExpressionMultipleIN (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 110))))))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 15))))) )) ) [Map.empty] Map.empty  `shouldBe`  (Boolean False,[Map.empty])


  describe "Actual Parameter Evaluator" $ do
    it "Actual Parameter Single" $ do
      actualParameterEval (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) [Map.empty] Map.empty `shouldBe` (Integer 35,[ Map.empty])
    it "Actual Parameter Multiple" $ do
      actualParameterEval (ActualParameterMultiple (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) (ExpressionMultipleNE (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )))) [Map.empty] Map.empty  `shouldBe`  (Real 1.4,[Map.empty])
      

  describe "Parameter List Evaluator" $ do
    it "Parameter List Single" $ do
      parameterListEval (ParameterListSingle (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ) [Map.empty] Map.empty `shouldBe` (Integer 35,[Map.empty])
    it "Parameter List Multiple" $ do
      parameterListEval (ParameterListMulitiple (ParameterListSingle (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) )  (ActualParameterMultiple (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) (ExpressionMultipleNE (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )))) ) [Map.empty] Map.empty `shouldBe` (Id "351.4",[Map.empty])


  describe "Procedure Statemnt List Evaluator" $ do
    it "Procedure Statemnt Single" $ do
      procedureStatementEval (MultiProcedureStatement "writeln" (ParameterListSingle (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ) ) [Map.empty] Map.empty `shouldBe`  (Id "35#&#!",[Map.empty])
    it "Procedure Statemnt null string" $ do
      procedureStatementEval (SingleProcedureStatement "Hello") [Map.empty] Map.empty `shouldBe` ((Real (0.11)), [Map.empty] )

--procedureStatementEval (MultiProcedureStatement str x) varMap  pfMap=((fst(procedureOrFunctionDeclarationEval (fromJust(Map.lookup  ((str)) pfMap)) varMap pfMap)), varMap)

  describe "Procedure Statemnt List Evaluator" $ do
    it "Procedure Statemnt Single" $ do
      simpleStatementEval (PS  (MultiProcedureStatement "writeln" (ParameterListSingle (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 79))))) )) ) ) )) [Map.empty] Map.empty `shouldBe`  (Id "79#&#!", [Map.empty] )
    it "Procedure Assigment Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      simpleStatementEval (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) )) [myMap] Map.empty `shouldBe` (Id "",[ myMap])

  describe "Assigment Statemnt  Evaluator" $ do
    it "Assign value " $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      assignmentStatementEval (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) [myMap] Map.empty `shouldBe`  [  myMap ] --[fromList [("hello",Real 1.0),("hi",Real 32.0)]]
    --it "Assign Multiple value " $ do
      --let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      --assignmentStatementEval (AssignmentStatementValue (Var "Baby") 55 ) [myMap] Map.empty  = (take ((length varMap) -1) varMap) ++ [(Map.insert (variableEval variable) ((value)) (last varMap))]
      -- assignmentStatementEval (AssignmentStatementValue variable value ) varMap pfMap = (take ((length varMap) -1) varMap)  ++ [(Map.insert (variableEval variable) ((value)) (last varMap))]

  describe "Simple Statemnt  Evaluator" $ do
    it "Simple value with assigment" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      simpleStatementEval (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ) [myMap] Map.empty  `shouldBe` (Id "",[myMap ])
    it "Simple statement with Procedure statement " $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      simpleStatementEval (PS (MultiProcedureStatement "writeln" (ParameterListSingle (ActualParameterSingle (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 10012))))) )) ) ) )) [myMap] Map.empty `shouldBe` (Id "10012#&#!",[myMap ])

  describe "Unlabelled Statement  Evaluator" $ do
    it "Simple Unlabelled Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      unlabelledStatementEval (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) )) [myMap] Map.empty `shouldBe` (Id "",[ myMap])
    it "Simple Unlabelled Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      unlabelledStatementEval (UnlabelledStatementStructuredStatement (StructuredStatementCompoundStatement (StatementsSingle (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) )) ) ) ) [myMap] Map.empty  `shouldBe` (Id "\"\"",[myMap])




  describe "Statement  Evaluator" $ do
    it "Simple Statement Statement" $ do
      let myMap = Map.fromList[("Baby", Integer(35))]
      --VariableMap = [Map.Map String Val]
      statementEval  ([ Map.empty])  (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) ))  Map.empty `shouldBe` ("\"\"", [myMap])


  describe "StatementS  Evaluator" $ do
    it "Single Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      --VariableMap = [Map.Map String Val]
      statementsEval (StatementsSingle (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) )) ) [myMap] Map.empty  `shouldBe`  (["\"\""],[ myMap ])
    it "Multiple Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      statementsEval (StatementsMultiple   (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) ))   (StatementsSingle (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) )) ))  [myMap] Map.empty  `shouldBe` (["\"\"","\"\""],[ myMap])



  describe "Structured Statement Statement  Evaluator" $ do
    it "Compound Statement" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      structuredStatementEval (StructuredStatementCompoundStatement (StatementsSingle (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) )) ) ) [myMap] Map.empty  `shouldBe` (Id "\"\"",[myMap])
    -- it "Compound Statement" $ do
    --   let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
    --   structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) varMap  pfMap= (fst(conditionalStatementEval conditionalStatement varMap pfMap), snd(conditionalStatementEval conditionalStatement varMap pfMap))

-- structuredStatementEval :: StructuredStatement -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
-- 
-- structuredStatementEval (  StructuredStatementConditionalStatement conditionalStatement) varMap  pfMap= (fst(conditionalStatementEval conditionalStatement varMap pfMap), snd(conditionalStatementEval conditionalStatement varMap pfMap))
-- structuredStatementEval (StructuredStatementRepetetiveStatement repetetiveStatement)varMap  pfMap= repetetiveStatement_eval repetetiveStatement varMap pfMap


-- unlabelledStatementEval :: UnlabelledStatement -> VariableMap->FunctionAndProcedureMap -> (Val, VariableMap)
-- 
-- unlabelledStatementEval (UnlabelledStatementStructuredStatement structuredStatement) varMap pfMap= (fst(structuredStatementEval structuredStatement varMap pfMap), snd(structuredStatementEval structuredStatement varMap pfMap))




  describe "If Statemnt List Evaluator" $ do
    it "If Statemnt Single" $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      ifStatementEval (IfState (ExpressionMultipleLT (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 45)))))) (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) ))) (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) ))) [myMap] Map.empty  `shouldBe` ("",[myMap])
    it "If ElseStatemnt " $ do
      let myMap = Map.fromList [("Baby", Integer(35)), ("hello", Real(1)), ("hi", Real(32))]
      let myMapR = Map.fromList [("Baby", Integer(95)), ("hello", Real(1)), ("hi", Real(32))]
      ifStatementEval (IfStateElse (ExpressionMultipleIN (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 110))))))  (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 15))))) )) ) (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 35))))) )) ) ))) )) (((StatementUnlabelledStatement (UnlabelledStatementSimpleStatement (SimpleStatementAssignment (AssignmentStatementMain (Var "Baby") (ExpressionSingle (SingleExpressionTermSingle (TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 95))))) )) ) ))) ))) [myMap] Map.empty  `shouldBe` ("\"\"",[ myMapR])





--myMap = Data.Map.fromList [("hello", Real(1)), ("hi", Real(32))]