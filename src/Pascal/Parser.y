{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token
        int             { Token _ (TokenInt $$) }
        float           { Token _ (TokenFloat $$) }
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '<>'             { Token _ (TokenOp "<>")   }
        '<'             { Token _ (TokenOp "<")   }
        '<='             { Token _ (TokenOp "<=")   }
        '>'             { Token _ (TokenOp ">")   }
        '>='             { Token _ (TokenOp ">=")   }
        'in'             { Token _ (TokenOp "in")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        '(.'             { Token _ (TokenK  "(.")   }
        '.)'             { Token _ (TokenK  ".)")   }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenOp ":=")   }
        ':'             { Token _ (TokenOp ":") }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'and'           { Token _ (TokenK "and") }
        'or'           { Token _ (TokenK "or") }
        'not'           { Token _ (TokenK "not") }
        'var'           { Token _ (TokenK "var") }
        'bool'          { Token _ (TokenK "bool") }
        'real'          { Token _ (TokenK "real") }
        'string'        { Token _ (TokenK "string") }
        ','             { Token _ (TokenK ",") }
        ';'             { Token _ (TokenK ";") }
        '.'             { Token _ (TokenK ".") }
        'program'       { Token _ (TokenK "program") }
        'div'           { Token _ (TokenK "div") }
        'mod'           { Token _ (TokenK "mod") }
        'nil'           { Token _ (TokenK "nil") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    --: Block '.' { $1 }   
    : ProgramHeading Block '.' {ProgramBlock $1 $2 }
    

ProgramHeading :: {ProgramHeading}
    :'program' Identifier '(' IdentifierList ')' ';' {ProgramHeadingWithList $2 $4}
    |'program' Identifier ';'{ProgramHeadingWithoutList $2}

IdentifierList:: {[String]}
    :Identifier{[$1]}
    |Identifier ',' IdentifierList { $1:$3 }

Identifier::  {String}
    : ID { $1 }

Block:: {Block}
    :CompoundStatement {BlockCopoundStatement $1 }
    | BlockOptions CompoundStatement {BlockVariableDeclarationPart $1 $2}

BlockOptions:: {BlockOptions}
    :VariableDeclarationPart {BlockOptionsVariableDeclarationPart $1}

VariableDeclarationPart:: {VariableDeclarationPart}
    : 'var' VariableDeclaration ';' {VariableDeclarationPartSingle $2 }
    | 'var' VariableDeclaration VariableDeclarationPartMultiple ';' {VariableDeclarationPartMultiple $2 $3 }

VariableDeclarationPartMultiple:: {VariableDeclarationPartMultiple}
    :';' VariableDeclaration {VariableDeclarationPartMultipleSingle $2}
    |';' VariableDeclaration VariableDeclarationPartMultiple {VariableDeclarationPartMultipleMultiple $2 $3}

VariableDeclaration:: {VariableDeclaration}
    : IdentifierList ':' VType {VariableDeclarationMain $1 }


CompoundStatement:: {[Statement]}
    : 'begin' Statements 'end' { $2 }

Statements:: {[Statement]}
    : { [] } -- nothing; make empty list
    |Statement{ [$1] }
    |Statement ';' Statements { $1:$3 }-- put statement as first element of statements

Statement :: {Statement}
    :UnlabelledStatement {StatementUnlabelledStatement $1}
    --| label COLON unlabelledStatement

UnlabelledStatement :: {UnlabelledStatement}
    : SimpleStatement {UnlabelledStatementSimpleStatement $1}
    --| StructuredStatement

SimpleStatement :: {SimpleStatement}
    : ProcedureStatement {PS $1}
    --| AssignmentStatement
    --| GotoStatement
    |  {ES}


ProcedureStatement :: {ProcedureStatement}
    : Identifier {SingleProcedureStatement $1 }
    |Identifier '(' ParameterList ')' { MultiProcedureStatement $1 $3 }

ParameterList :: {ParameterList}
    : ActualParameter { ParameterListSingle $1}
    | ParameterList ',' ActualParameter{ParameterListMulitiple $1 $3}

ActualParameter :: {ActualParameter}
    : Expression {ActualParameterSingle $1 }
    | ActualParameter ':' Expression { ActualParameterMultiple $1 $3 }

Expression :: {Expression}
    : SimpleExpression {ExpressionSingle $1 }
    | SimpleExpression Relationaloperator Expression {ExpressionMultiple $1 $2 $3 }

SimpleExpression :: {SimpleExpression}
    : Term {SingleExpressionTermSingle $1}
    | Term Additiveoperator SimpleExpression {SingleExpressionTermMultiple $1 $2 $3}

Relationaloperator :: {Relationaloperator}
   : '=' {RelationaloperatorE}
   | '<>' {RelationaloperatorNE}
   | '<' {RelationaloperatorLT } 
   | '<=' {RelationaloperatorLTE}
   | '>' {RelationaloperatorGT }
   | '>=' {RelationaloperatorGTE}
   | 'in' {RelationaloperatorIN}

Term :: {Term}
    : SignedFactor {TermSingle $1}
    | SignedFactor Multiplicativeoperator Term {TermMultiple $1 $2 $3}

Additiveoperator :: {Additiveoperator}
    : '+' {Plus}
    | '-' {Minus}
    | 'or' {Or}

SignedFactor :: {SignedFactor}
: Factor {SignedFactorDefault $1}
| '+' Factor {SignedFactorPlus $2}
| '-' Factor {SignedFactorMinus $2}

Multiplicativeoperator :: {Multiplicativeoperator}
    : '*' {MultiplicativeoperatorMultiplication}
    | '/'{MultiplicativeoperatorDivision}
    | 'div'{MultiplicativeoperatorDiv}
    | 'mod'{MultiplicativeoperatorMod}
    | 'and'{MultiplicativeoperatorAnd}

Factor :: {Factor}
    : Variable{FactorVariable $1}
    | '(' Expression ')'{FactorExpression $2}
    | FunctionDesignator{FactorFD $1}
    | UnsignedConstant{FactorUC $1}
    | Set {FactorSe $1}
    | 'not' Factor{FactorNot $2}
    | Bool {FactorBool $1}

Variable :: {Variable}
    : Identifier {Var $1} --(LBRACK expression (COMMA expression)* RBRACK | LBRACK2 expression (COMMA expression)* RBRACK2 | DOT identifier | POINTER)*

FunctionDesignator :: {FunctionDesignator}
    : Identifier '(' ParameterList ')' { FDesignate $1 $3 }

UnsignedConstant :: {UnsignedConstant}
    : UnsignedNumber {UN $1}
    | 'nil' {Nil}

UnsignedNumber :: {UsignedNumber}
    : UnsignedInteger {UI $1}
    | UnsignedReal {UR $1}

UnsignedInteger :: {int} --may need to be something else
    : int {$1}

UnsignedReal :: {float} --may need to be something else
    : float {$1}



Set :: {Set}
    : '(' ElementList ')' {SetElement $2 }
    | '(.' ElementList '.)' {SetElement2 $2 }

ElementList :: {ElementList}
    : Element {ElementListElemntSingle [$1]}
    --| Element ',' ElementList {ElementListElemntMultiple $1:$3} --IDK

Element :: {Element}
    : Expression {ElementExpression $1}
    --| Expression '..' Expression

Bool :: {Bool}
    : 'true' {True}
    | 'false' {False}
    --ID ':=' Exp { Assign $1 $3 }

    
--Defs :: {[Definition]}
   -- : { [] } -- nothing; make empty list
    -- | Definition Defs { $1:$2 } -- put statement as first element of statements

--Definition :: {Definition}
   -- : 'var' IdentiferList ':' Type { VarDef $2 $4 }  

VType :: {VType}
    : 'bool' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }



-- Expressions
--Exp :: {Exp}
    -- : '+' Exp { $2 } -- ignore Plus
    -- | '-' Exp { Op1 "-" $2}
    -- | Exp '+' Exp { Op2 "+" $1 $3 }
    -- | Exp '*' Exp { Op2 "*" $1 $3 }
    -- | '(' Exp ')' { $2 } -- ignore brackets

--BoolExp :: {BoolExp}
    -- : 'true' { True_C }
    -- | 'false' { False_C }
    -- | 'not' BoolExp { Not $2 }
    -- | BoolExp 'and' BoolExp { OpB "and" $1 $3 }
    -- | Identifier { Var_B $1 }

{}
