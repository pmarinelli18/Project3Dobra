-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val
import Pascal.Data
import Pascal.Interpret
import qualified Data.Map as Map


main :: IO ()
main = hspec $ do
  describe "Unsigned Numebr Eval" $ do
    it "test Unsigned" $ do
      unsignedNumberEval (UI 5)  `shouldBe` (Integer (5))
    it "Float Unsigned" $ do
      unsignedNumberEval (UR 5)  `shouldBe` (Real (5.0))
  
  describe "unsigned Constant Eval" $ do
    it "test Unsigned Constant" $ do
      unsignedConstantEval (UN (UI 5)) [Map.empty] Map.empty `shouldBe` (Integer 5, [Map.empty])
      unsignedConstantEval (UN (UR 5)) [Map.empty] Map.empty `shouldBe` (Real 5, [Map.empty])
      unsignedConstantEval (Str "something") [Map.empty] Map.empty `shouldBe` (Id "something", [Map.empty])
      unsignedConstantEval (Nil) [Map.empty] Map.empty `shouldBe` ((Id ("Nil")), [Map.empty])
    





--unsignedConstantEval unsignedConstant varMap pfMap

-- unsignedConstantEval :: UnsignedConstant -> VariableMap -> FunctionAndProcedureMap -> (Val, VariableMap)
-- unsignedConstantEval (UN unsignedNumber) varMap  pfMap= (unsignedNumberEval unsignedNumber, varMap)
-- unsignedConstantEval (Str str) varMap  pfMap= ((Id str), varMap)
-- unsignedConstantEval (Nil) varMap pfMap= ((Id ("Nil")), varMap)

-- factorEval (FactorUC unsignedConstant) varMap pfMap =  (fst(unsignedConstantEval unsignedConstant varMap pfMap), snd(unsignedConstantEval unsignedConstant varMap pfMap))