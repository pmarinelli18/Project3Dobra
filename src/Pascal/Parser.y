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
        st              { Token _ (TokenSt $$) }
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
        'procedure'     { Token _ (TokenK "procedure") }
        'div'           { Token _ (TokenK "div") }
        'mod'           { Token _ (TokenK "mod") }
        'nil'           { Token _ (TokenK "nil") }
        'if'            { Token _ (TokenK "if") }
        'then'          { Token _ (TokenK "then") }
        'else'          { Token _ (TokenK "else") } 
        'case'          { Token _ (TokenK "case") }
        'of'            { Token _ (TokenK "of") }
        'while'         { Token _ (TokenK "while") }
        'do'            { Token _ (TokenK "do") }
        'repeat'        { Token _ (TokenK "repeat") }
        'until'         { Token _ (TokenK "until") }
        'for'           { Token _ (TokenK "for") }
        'assign'        { Token _ (TokenK "assign") }
        'to'            { Token _ (TokenK "to") }
        'downto'        { Token _ (TokenK "downto") }
        'with'          { Token _ (TokenK "with") }

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
    : CompoundStatement {BlockCopoundStatement $1}
    | BlockOptions CompoundStatement{BlockVariableDeclarationPart $1 $2}
    | ProcedureAndFunctionDeclarationPart CompoundStatement {Block_Method $1 $2}
    | BlockOptions ProcedureAndFunctionDeclarationPart CompoundStatement {Block_Variable_Method $1 $2 $3}

ProcedureAndFunctionDeclarationPart :: {ProcedureAndFunctionDeclarationPart}
    : ProcedureOrFunctionDeclaration ';' {Declaration $1}

ProcedureOrFunctionDeclaration :: {ProcedureOrFunctionDeclaration}
    : ProcedureDeclaration  {Procedure_method $1 }
--  | FunctionDeclaration {Function_method $1}

ProcedureDeclaration :: {ProcedureDeclaration}
    : 'procedure' Identifier '('   ')'  ';'  Block {Procedure_no_identifier $2 $6}
    | 'procedure' Identifier '(' FormalParameterList ')'  ';'  Block {Procedure_with_identifier $2 $4 $7}

FormalParameterList :: {FormalParameterList}
    : FormalParameterSection {Singleparameter $1 }
    | FormalParameterSection ';'  FormalParameterList {Multipleparameter $1 $3}
--Warning ---     | FormalParameterSection ';' FormalParameterList {Multipleparamete $1 :$3}
--sHOUULD i USE $1 : $3 or not

FormalParameterSection :: {FormalParameterSection}
    : ParameterGroup {Simple_parameterGroup $1}
    | 'var' ParameterGroup {Var_parameterGroup $2}


ParameterGroup :: {ParameterGroup}
    : IdentifierList ':'Identifier {Parameter_group $1 $3}





BlockOptions:: {BlockOptions}
    :VariableDeclarationPart {BlockOptionsVariableDeclarationPart $1}

VariableDeclarationPart:: {VariableDeclarationPart}
    : 'var' VariableDeclaration VariableDeclarationPartMultiple  {VariableDeclarationPartMultiple $2 $3 }
    | 'var' VariableDeclaration  {VariableDeclarationPartSingle $2 }

VariableDeclarationPartMultiple:: {VariableDeclarationPartMultiple}
    : VariableDeclaration VariableDeclarationPartMultiple {VariableDeclarationPartMultipleMultiple $1 $2}
    | VariableDeclaration {VariableDeclarationPartMultipleSingle $1}

VariableDeclaration:: {VariableDeclaration}
    : IdentifierList ':' VType ';'{VariableDeclarationMain $1 $3 }


CompoundStatement:: {[Statement]}
    : 'begin' Statements 'end' { $2 }

Statements:: {[Statement]}
    : { [] } -- nothing; make empty list
    |Statement{ [$1] }
    |Statement ';' Statements { $1:$3 }-- put statement as first element of statements

Statement :: {Statement}
    :UnlabelledStatement {StatementUnlabelledStatement $1}
    --| label COLON unlabelledStatement

IfStatement :: {IfStatement}
    : 'if' Expression 'then' Statement {IfState $2 $4}
    | 'if' Expression 'then' Statement 'else' Statement {IfStateElse $2 $4 $6}

ConstList :: {ConstList}
    : Constant {ConstListSingle $1}
    | Constant ',' ConstList {ConstListMultiple $1 $3}

Sign :: {Sign}
    : '+' {SignPos}
    | '-' {SignNeg}


Constant :: {Constant}
    : UnsignedNumber {ConstantUN $1}
    | Sign UnsignedNumber {ConstantSUN $1 $2}
    | Identifier {ConstantI $1} 
    | Sign Identifier {ConstantSI $1 $2}
    | st {ConstantS $1}

CaseListElement :: {CaseListElement}
    : ConstList ':' Statement {CaseListElementSingle $1 $3}

CaseListElements :: {CaseListElements}
    : CaseListElement {CaseListElementsSingle $1}
    | CaseListElement ';' CaseListElements {CaseListElementsMultiple $1 $3}

CaseStatement :: {CaseStatement}
    : 'case' Expression 'of' CaseListElements 'end' {Case $2 $4}
    | 'case' Expression 'of' CaseListElements ';' 'else' Statements 'end' {CaseElse $2 $4 $7}

ConditionalStatement :: {ConditionalStatement}
    : IfStatement {ConditionalStatementIf $1} 
    | CaseStatement {ConditionalStatementCase $1}

WhileStatement :: {WhileStatement}
    : 'while' Expression 'do' Statement {WhileS $2 $4}

RepeatStatement :: {RepeatStatement}
    : 'repeat' Statements 'until' Expression {Repeat $2 $4}

ForStatement :: {ForStatement}
    : 'for' Identifier ':='  Expression 'to' Expression 'do' Statement {ForTo $2 $4 $6 $8}
    | 'for' Identifier ':=' Expression 'downto' Expression 'do' Statement {ForDown $2 $4 $6 $8}
    

--ForList :: {ForList}
--    : Expression 'to' Expression {ForListTo $1 $3}
--    | Expression 'downto' Expression {ForListDownTo $1 $3}

RepetetiveStatement :: {RepetetiveStatement}
    : WhileStatement {RepetetiveStatementWhile $1}
    | RepeatStatement {RepetetiveStatementRepeat $1}
    | ForStatement {RepetetiveStatementFor $1}

Variable :: {Variable}
    :  Identifier {Var $1 }--(LBRACK expression (COMMA expression)* RBRACK | LBRACK2 expression (COMMA expression)* RBRACK2 | DOT identifier | POINTER)*

RecordVariableList :: {RecordVariableList}
    : Variable {RecordVariableListSingle $1}
    | Variable ',' RecordVariableList {RecordVariableListMultiple $1 $3}

WithStatement :: {WithStatement}
    : 'with' RecordVariableList 'do' Statement {With $2 $4}

StructuredStatement :: {StructuredStatement}
    : CompoundStatement {StructuredStatementCompoundStatement $1}
    | ConditionalStatement {StructuredStatementConditionalStatement $1}
    | RepetetiveStatement {StructuredStatementRepetetiveStatement $1}
    | WithStatement {StructuredStatementWithStatement $1}

UnlabelledStatement :: {UnlabelledStatement}
    : SimpleStatement {UnlabelledStatementSimpleStatement $1}
    | StructuredStatement {UnlabelledStatementStructuredStatement $1}

SimpleStatement :: {SimpleStatement}
    : ProcedureStatement {PS $1}
    --| AssignmentStatement
    --| GotoStatement


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
    | SimpleExpression '<>' Expression {ExpressionMultipleNE $1 $3 }
    | SimpleExpression '=' Expression {ExpressionMultipleE $1 $3 }
    | SimpleExpression '<' Expression {ExpressionMultipleLT $1 $3 }
    | SimpleExpression '<=' Expression {ExpressionMultipleLTE $1 $3 }
    | SimpleExpression '>' Expression {ExpressionMultipleGT $1 $3 }
    | SimpleExpression '>=' Expression {ExpressionMultipleGTE $1 $3 }
    | SimpleExpression 'in' Expression {ExpressionMultipleIN $1 $3 }

SimpleExpression :: {SimpleExpression}
    : Term {SingleExpressionTermSingle $1}
    | Term '+' SimpleExpression {SingleExpressionTermMultipleAdd $1 $3}
    | Term '-' SimpleExpression {SingleExpressionTermMultipleSub $1 $3}
    | Term 'or' SimpleExpression {SingleExpressionTermMultipleOr $1 $3}


Term :: {Term}
    : SignedFactor {TermSingle $1}
    | SignedFactor '*' Term {TermMultipleMult $1 $3}
    | SignedFactor '/' Term {TermMultipleDivision $1 $3}
    | SignedFactor 'div' Term {TermMultipleDiv $1 $3}
    | SignedFactor 'mod' Term {TermMultipleMod $1 $3}
    | SignedFactor 'and' Term {TermMultipleAnd $1 $3}


SignedFactor :: {SignedFactor}
: Factor {SignedFactorDefault $1}
| '+' Factor {SignedFactorPlus $2}
| '-' Factor {SignedFactorMinus $2}

Factor :: {Factor}
    : Variable{FactorVariable $1}
    | '(' Expression ')'{FactorExpression $2}
    | FunctionDesignator{FactorFD $1}
    | UnsignedConstant{FactorUC $1}
    | Set {FactorSe $1}
    | 'not' Factor{FactorNot $2}
    | Bool {FactorBool $1}
    
FunctionDesignator :: {FunctionDesignator}
    : Identifier '(' ParameterList ')' { FDesignate $1 $3 }

UnsignedConstant :: {UnsignedConstant}
    : UnsignedNumber {UN $1}
    | st { Str $1}
    | 'nil' {Nil}
    
UnsignedNumber :: {UnsignedNumber}
    : UnsignedInteger {UI $1}
    | UnsignedReal {UR $1}

UnsignedInteger :: {Int} --may need to be something else
    : int {$1}

UnsignedReal :: {Float} --may need to be something else
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
