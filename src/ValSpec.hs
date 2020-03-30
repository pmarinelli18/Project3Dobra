import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val

main ::IO()
main = hspec $ do
    describe "strToVal" $ do 
        it "convert a string into  Val data type" $ do
            strToVal "Val"  `shouldBe` Id "Val"

        it "convert a integer into  Val data type" $ do
            strToVal "99" `shouldBe` Integer 99

        it "convert a Float into  Val data type" $ do
            strToVal "10.5" `shouldBe` Real(10.5)


    describe "valToStr" $ do
        it "convert a Value  into  String data type" $ do
            valToStr (Real(55.0)) `shouldBe` show 55.0
        
        it "convert a Value  into  String data type" $ do
            valToStr (Integer(19)) `shouldBe` show 19
        
        it "convert a Value  into  String data type" $ do
            valToStr (Boolean (True)) `shouldBe` show True

    describe "toFloat" $ do
        it "convert to Float  if it is a real type" $ do
            toFloat (Real(55.0)) `shouldBe`  55.0

        it "convert to Float  if it is a float number" $ do
            toFloat (Integer(55)) `shouldBe`  55.0

        it "Error if deal with  Id" $ do
            evaluate (toFloat (Id("Hello"))) `shouldThrow` errorCall "Not convertible to float"

        it "Error if deal with  Boolean" $ do
            evaluate (toFloat (Boolean(True))) `shouldThrow` errorCall "Not convertible to float"

    describe "toInt" $ do
        it "convert to Int  if deal with real type" $ do
            toInt (Real(55.5)) `shouldBe`  55
        
        it "convert to Int  if deal with Integer type" $ do
            toInt (Integer(55)) `shouldBe`  55

        it "Error if deal with  Id" $ do
            evaluate (toInt (Id("Hello"))) `shouldThrow` errorCall "Not convertible to Integer"

        it "Error if deal with  Boolean" $ do
            evaluate ( toInt (Boolean(True))) `shouldThrow` errorCall "Not convertible to Integer"


    describe "toBool" $ do
        it "error when trying to  turn a Real into True/False" $ do
           evaluate ( toBool ( Id ("hewno")) ) `shouldThrow` errorCall "Not convertible to Integer"

        it "error can turn a Real iIntegern/vÅQto True/False" $ do
           evaluate ( toBool ( Integer (55)) ) `shouldThrow` errorCall "Not convertible to Integer"

        it "error can turn a Real iIntegern/vÅQto True/False" $ do
           evaluate ( toBool ( Real(55)) ) `shouldThrow` errorCall "Not convertible to Integer"

        it "convert a Val Boolean into an actual Boolean type" $ do
            toBool (Boolean(True) )`shouldBe`  True

    describe "removePunc2" $ do
        it "get rid of extra \' and \\ " $ do 
            removePunc2 ("\"\\\"Music\\\"\"") `shouldBe` "Music"
     
