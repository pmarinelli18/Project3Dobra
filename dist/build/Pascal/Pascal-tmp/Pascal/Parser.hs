{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: (Program) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> (Program)
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: ([Definition]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> ([Definition])
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (Definition) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> (Definition)
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (VType) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (VType)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: ([String]) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> ([String])
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (Exp) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (Exp)
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: (BoolExp) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> (BoolExp)
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: ([Statement]) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> ([Statement])
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (Statement) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (Statement)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x20\x00\x00\x00\x00\x01\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x10\x00\x00\x00\x00\x00\x02\x00\x00\x18\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x00\x00\x00\x80\x11\x00\x00\x00\x8c\x00\x00\x00\x60\x04\x00\x00\x00\x45\x00\x00\x00\x20\x00\x00\x00\x00\x01\x00\x00\x00\x46\x00\x00\x00\x30\x02\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","Defs","Definition","Type","ID_List","Exp","BoolExp","Statements","Statement","int","ID","'+'","'-'","'*'","'/'","'='","'('","')'","'begin'","'end'","':='","'true'","'false'","'and'","'not'","'var'","':'","'bool'","'real'","'string'","','","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xf8\xff\xf8\xff\x08\x00\xf9\xff\x07\x00\x0d\x00\x05\x00\x01\x00\x00\x00\x00\x00\x03\x00\x01\x00\x01\x00\x01\x00\xfe\xff\x0e\x00\x0e\x00\x01\x00\x01\x00\x00\x00\x0e\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x14\x00\x00\x00\x04\x00\x00\x00\x00\x00\x06\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x11\x00\x12\x00\x13\x00\x00\x00\x00\x00\x00\x00\x15\x00\x16\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\xec\xff\x00\x00\x00\x00\xec\xff\x00\x00\x00\x00\xeb\xff\xfe\xff\xea\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf4\xff\xf5\xff\x00\x00\x00\x00\xf2\xff\xf3\xff\xf1\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x0a\x00\x05\x00\x03\x00\x04\x00\x03\x00\x09\x00\x05\x00\x08\x00\x02\x00\x07\x00\x08\x00\x07\x00\x08\x00\x02\x00\x17\x00\x0c\x00\x0b\x00\x05\x00\x00\x00\x05\x00\x05\x00\x05\x00\x05\x00\xff\xff\x05\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x12\x00\x03\x00\x13\x00\x0c\x00\x0d\x00\x12\x00\x16\x00\x13\x00\x0e\x00\x07\x00\x04\x00\x05\x00\x08\x00\x05\x00\x07\x00\xff\xff\x08\x00\x0a\x00\x13\x00\x03\x00\x0a\x00\x10\x00\x0f\x00\x0e\x00\x00\x00\x14\x00\x13\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 21) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21)
	]

happy_n_terms = 24 :: Int
happy_n_nonterms = 9 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happySpecReduce_3  0# happyReduction_1
happyReduction_1 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn4
		 (happy_var_2
	)}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 (happy_var_1:happy_var_2
	)}}

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happyReduce 4# 2# happyReduction_4
happyReduction_4 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_2 of { happy_var_2 -> 
	case happyOut7 happy_x_4 of { happy_var_4 -> 
	happyIn6
		 (VarDef happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happySpecReduce_1  3# happyReduction_5
happyReduction_5 happy_x_1
	 =  happyIn7
		 (BOOL
	)

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happySpecReduce_1  3# happyReduction_6
happyReduction_6 happy_x_1
	 =  happyIn7
		 (REAL
	)

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happySpecReduce_1  3# happyReduction_7
happyReduction_7 happy_x_1
	 =  happyIn7
		 (STRING
	)

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happySpecReduce_1  4# happyReduction_8
happyReduction_8 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn8
		 ([happy_var_1]
	)}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happySpecReduce_3  4# happyReduction_9
happyReduction_9 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (happy_var_1:happy_var_3
	)}}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happySpecReduce_2  5# happyReduction_10
happyReduction_10 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (happy_var_2
	)}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happySpecReduce_2  5# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (Op1 "-" happy_var_2
	)}

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happySpecReduce_3  5# happyReduction_12
happyReduction_12 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happySpecReduce_3  5# happyReduction_13
happyReduction_13 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happySpecReduce_3  5# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (happy_var_2
	)}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_1  6# happyReduction_15
happyReduction_15 happy_x_1
	 =  happyIn10
		 (True_C
	)

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_1  6# happyReduction_16
happyReduction_16 happy_x_1
	 =  happyIn10
		 (False_C
	)

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happySpecReduce_2  6# happyReduction_17
happyReduction_17 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_2 of { happy_var_2 -> 
	happyIn10
		 (Not happy_var_2
	)}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happySpecReduce_3  6# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (OpB "and" happy_var_1 happy_var_3
	)}}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_0  7# happyReduction_19
happyReduction_19  =  happyIn11
		 ([]
	)

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happySpecReduce_2  7# happyReduction_20
happyReduction_20 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (happy_var_1:happy_var_2
	)}}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happySpecReduce_3  8# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn12
		 (Assign happy_var_1 happy_var_3
	)}}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 23# tk action sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 1#;
	Token _ (TokenID happy_dollar_dollar) -> cont 2#;
	Token _ (TokenOp "+") -> cont 3#;
	Token _ (TokenOp "-") -> cont 4#;
	Token _ (TokenOp "*") -> cont 5#;
	Token _ (TokenOp "/") -> cont 6#;
	Token _ (TokenOp "=") -> cont 7#;
	Token _ (TokenK  "(") -> cont 8#;
	Token _ (TokenK  ")") -> cont 9#;
	Token _ (TokenK "begin") -> cont 10#;
	Token _ (TokenK "end") -> cont 11#;
	Token _ (TokenK ":=") -> cont 12#;
	Token _ (TokenK "true") -> cont 13#;
	Token _ (TokenK "false") -> cont 14#;
	Token _ (TokenK "and") -> cont 15#;
	Token _ (TokenK "not") -> cont 16#;
	Token _ (TokenK "var") -> cont 17#;
	Token _ (TokenK ":") -> cont 18#;
	Token _ (TokenType "bool") -> cont 19#;
	Token _ (TokenType "bool") -> cont 20#;
	Token _ (TokenType "bool") -> cont 21#;
	Token _ (TokenK ",") -> cont 22#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 23# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (happyOut4 x))

happySeq = happyDontSeq



{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc8380_0/ghc_2.h" #-}


























































































































































































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 180 "templates\\\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
