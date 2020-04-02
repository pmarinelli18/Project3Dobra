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


-- simpleExpressionEval :: SimpleExpression -> VariableMap -> FunctionAndProcedureMap ->(Val, VariableMap)
-- simpleExpressionEval (SingleExpressionTermSingle term) varMap  pfMap= (fst(termEval term varMap pfMap),snd(termEval term varMap pfMap))
-- simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) + (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
-- simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) - (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
-- simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap  pfMap= ((Boolean((toBool (fst(termEval term varMap pfMap))) || (toBool (fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)


--  describe "Expression Eval" $ do
--    it "Expression Eval" $ do
--      expressionEval (ExpressionSingle simpleExpression ) varMap  pfMap= (fst(simpleExpressionEval simpleExpression varMap pfMap), snd(simpleExpressionEval simpleExpression varMap pfMap))




-- expressionEval :: Expression -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
-- expressionEval (ExpressionSingle simpleExpression ) varMap  pfMap= (fst(simpleExpressionEval simpleExpression varMap pfMap), snd(simpleExpressionEval simpleExpression varMap pfMap))
-- expressionEval (ExpressionMultipleE simpleExpression expression) varMap  pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) == (fst(expressionEval expression varMap pfMap)))), varMap)
-- expressionEval (ExpressionMultipleNE simpleExpression expression) varMap pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) /= (fst(expressionEval expression varMap pfMap)))), varMap)
-- expressionEval (ExpressionMultipleLT simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) < (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
-- expressionEval (ExpressionMultipleLTE simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) <= (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
-- expressionEval (ExpressionMultipleGT simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) > (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
-- expressionEval (ExpressionMultipleGTE simpleExpression expression) varMap pfMap= ((Boolean ((toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))) >= (toFloat(fst(expressionEval expression varMap pfMap))))), varMap)
-- expressionEval (ExpressionMultipleIN simpleExpression expression) varMap pfMap= ((Boolean (fst((simpleExpressionEval simpleExpression varMap pfMap)) == (fst(expressionEval expression varMap pfMap)))), varMap)

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
    it "term signed factor" $ do
        termEval (TermSingle (  SignedFactorMinus ( FactorUC (UN (UI 5))))) [Map.empty] Map.empty `shouldBe` (Real (-5.0),[ Map.empty])
        termEval (TermMultipleMult (  SignedFactorMinus ( FactorUC (UN (UI 5)))) ( TermSingle (  SignedFactorPlus ( FactorUC (UN (UI 20)))) )) [Map.empty] Map.empty `shouldBe` (Real (-100.0),[Map.empty])

    -- termEval (TermMultipleMult signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap pfMap) )) * (toFloat(fst(termEval term varMap pfMap))))), varMap)


-- termEval :: Term -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
-- termEval (TermSingle signedFactor) varMap pfMap = (fst(signedFactorEval signedFactor varMap pfMap), snd(signedFactorEval signedFactor varMap pfMap))
-- termEval (TermMultipleMult signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap pfMap) )) * (toFloat(fst(termEval term varMap pfMap))))), varMap)
-- termEval (TermMultipleDivision signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap  pfMap))) / (toFloat(fst(termEval term varMap pfMap ))))), varMap)
-- termEval (TermMultipleDiv signedFactor term) varMap pfMap = ((Real((toFloat (fst(signedFactorEval signedFactor varMap pfMap))) / (toFloat(fst(termEval term varMap pfMap))))), varMap)
-- termEval (TermMultipleMod signedFactor term) varMap pfMap = ((Integer(( mod (toInt (fst(signedFactorEval signedFactor varMap pfMap)))  (toInt(fst(termEval term varMap pfMap)))))), varMap)--Integer((toInt(signedFactorEval signedFactor)) `mod` (toInt(termEval term)))
-- termEval (TermMultipleAnd signedFactor term) varMap pfMap = ((Boolean((toBool (fst(signedFactorEval signedFactor varMap pfMap))) && (toBool(fst(termEval term varMap pfMap))))), varMap)

  -- describe "Simple Expression" $ do
  --   it "simple Expression" $ do


-- simpleExpressionEval :: SimpleExpression -> VariableMap -> FunctionAndProcedureMap ->(Val, VariableMap)
-- simpleExpressionEval (SingleExpressionTermSingle term) varMap  pfMap= (fst(termEval term varMap pfMap),snd(termEval term varMap pfMap))
-- simpleExpressionEval (SingleExpressionTermMultipleAdd term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) + (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
-- simpleExpressionEval (SingleExpressionTermMultipleSub term simpleExpression) varMap  pfMap= ((Real((toFloat (fst(termEval term varMap pfMap))) - (toFloat(fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)
-- simpleExpressionEval (SingleExpressionTermMultipleOr term simpleExpression) varMap  pfMap= ((Boolean((toBool (fst(termEval term varMap pfMap))) || (toBool (fst(simpleExpressionEval simpleExpression varMap pfMap))))), varMap)












--myMap = Data.Map.fromList [("hello", Real(1)), ("hi", Real(32))]