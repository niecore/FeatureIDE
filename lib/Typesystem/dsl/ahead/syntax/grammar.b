// Automatically generated Bali code.  Edit at your own risk!
// Generated by "balicomposer" v2003.02.17.

//-----------------------------------//
// Option block:
//-----------------------------------//

options {
    CACHE_TOKENS = true ;
    JAVA_UNICODE_ESCAPE = true ;
    //OPTIMIZE_TOKEN_MANAGER = true ;
    STATIC = false ;
} options

//-----------------------------------//
// Parser code block:
//-----------------------------------//

code {} code

//-----------------------------------//
// Token manager declarations:
//-----------------------------------//

// No TOKEN_MGR_DECLS defined in Bali grammar.

//-----------------------------------//
// Bali tokens:
//-----------------------------------//

"->"            	ARROW
"condition"     	CONDITION
"Delivery_parameters"	DELIVERY
"Transition"    	EDGE
"Transition_action"	EDGEACTION
"Transition_condition"	EDGETEST
"Enter"         	ENTER
"Exit"          	EXIT
"Goto_state"    	GOTO_STATE
"("             	LPAREN
"Nested_state"  	NESTED_STATE
"Otherwise"     	OTHERWISE
"Otherwise_default"	OTHERWISE_DEFAULT
"Prepare"       	PREPARE
"Proceed"       	PROCEED
")"             	RPAREN
"States"        	STATES
"State_machine" 	STATE_MACHINE
"Unrecognizable_state"	UNRECOGNIZABLE_STATE


//-----------------------------------//
// Regular expression tokens:
//-----------------------------------//

TOKEN: {
  < ABSTRACT: "abstract" > |  < BOOLEAN: "boolean" > |  < BREAK: "break" > |  < BYTE: "byte" > |  < CASE: "case" > |  < CATCH: "catch" > |  < CHAR: "char" > |  < CLASS: "class" > |  < CONST: "const" > |  < CONTINUE: "continue" > |  < _DEFAULT: "default" > |  < DO: "do" > |  < DOUBLE: "double" > |  < ELSE: "else" > |  < EXTENDS: "extends" > |  < FALSE: "false" > |  < FINAL: "final" > |  < FINALLY: "finally" > |  < FLOAT: "float" > |  < FOR: "for" > |  < GOTO: "goto" > |  < IF: "if" > |  < IMPLEMENTS: "implements" > |  < IMPORT: "import" > |  < INSTANCEOF: "instanceof" > |  < INT: "int" > |  < INTERFACE: "interface" > |  < LONG: "long" > |  < NATIVE: "native" > |  < NEW: "new" > |  < NULL: "null" > |  < PACKAGE: "package"> |  < PRIVATE: "private" > |  < PROTECTED: "protected" > |  < PUBLIC: "public" > |  < RETURN: "return" > |  < SHORT: "short" > |  < STATIC: "static" > |  < SUPER: "super" > |  < SWITCH: "switch" > |  < SYNCHRONIZED: "synchronized" > |  < THIS: "this" > |  < THROW: "throw" > |  < THROWS: "throws" > |  < TRANSIENT: "transient" > |  < TRUE: "true" > |  < TRY: "try" > |  < VOID: "void" > |  < VOLATILE: "volatile" > |  < WHILE: "while" > | 
  < INTEGER_LITERAL:
        <DECIMAL_LITERAL> (["l","L"])?
      | <HEX_LITERAL> (["l","L"])?
      | <OCTAL_LITERAL> (["l","L"])?
  > | 
  < #DECIMAL_LITERAL: ["1"-"9"] (["0"-"9"])* > | 
  < #HEX_LITERAL: "0" ["x","X"] (["0"-"9","a"-"f","A"-"F"])+ > | 
  < #OCTAL_LITERAL: "0" (["0"-"7"])* > | 
  < FLOATING_POINT_LITERAL:
        (["0"-"9"])+ "." (["0"-"9"])* (<EXPONENT>)? (["f","F","d","D"])?
      | "." (["0"-"9"])+ (<EXPONENT>)? (["f","F","d","D"])?
      | (["0"-"9"])+ <EXPONENT> (["f","F","d","D"])?
      | (["0"-"9"])+ (<EXPONENT>)? ["f","F","d","D"]
  > | 
  < #EXPONENT: ["e","E"] (["+","-"])? (["0"-"9"])+ > | 
  < CHARACTER_LITERAL:
      "'"
      (   (~["'","\\","\n","\r"])
        | ("\\"
            ( ["n","t","b","r","f","\\","'","\""]
            | ["0"-"7"] ( ["0"-"7"] )?
            | ["0"-"3"] ["0"-"7"] ["0"-"7"]
            )
          )
      )
      "'"
  > | 
  < STRING_LITERAL:
      "\""
      (   (~["\"","\\","\n","\r"])
        | ("\\"
            ( ["n","t","b","r","f","\\","'","\""]
            | ["0"-"7"] ( ["0"-"7"] )?
            | ["0"-"3"] ["0"-"7"] ["0"-"7"]
            )
          )
      )*
      "\""
  > | 
  < LBRACE: "{" > |  < RBRACE: "}" > |  < LBRACKET: "[" > |  < RBRACKET: "]" > |  < SEMICOLON: ";" > |  < COMMA: "," > |  < DOT: "." > | 
  < ASSIGN: "=" > |  < GT: ">" > |  < LT: "<" > |  < BANG: "!" > |  < TILDE: "~" > |  < HOOK: "?" > |  < COLON: ":" > |  < EQ: "==" > |  < LE: "<=" > |  < GE: ">=" > |  < NE: "!=" > |  < SC_OR: "||" > |  < SC_AND: "&&" > |  < INCR: "++" > |  < DECR: "--" > |  < PLUS: "+" > |  < MINUS: "-" > |  < STAR: "*" > |  < SLASH: "/" > |  < BIT_AND: "&" > |  < BIT_OR: "|" > |  < XOR: "^" > |  < REM: "%" > |  < LSHIFT: "<<" > |  < RSIGNEDSHIFT: ">>" > |  < RUNSIGNEDSHIFT: ">>>" > |  < PLUSASSIGN: "+=" > |  < MINUSASSIGN: "-=" > |  < STARASSIGN: "*=" > |  < SLASHASSIGN: "/=" > |  < ANDASSIGN: "&=" > |  < ORASSIGN: "|=" > |  < XORASSIGN: "^=" > |  < REMASSIGN: "%=" > |  < LSHIFTASSIGN: "<<=" > |  < RSIGNEDSHIFTASSIGN: ">>=" > |  < RUNSIGNEDSHIFTASSIGN: ">>>=" > | 
	<AI_BEGIN: "ai{"> | 	<AI_END: "}ai"> | 	<AI_ESCAPE: "$ai"> | 	<CASE_BEGIN: "case{"> | 	<CASE_END: "}case"> | 	<CASE_ESCAPE: "$case"> | 	<CAT_BEGIN: "cat{"> | 	<CAT_END: "}cat"> | 	<CAT_ESCAPE: "$cat"> | 	<CLS_BEGIN: "cls{"> | 	<CLS_END: "}cls"> | 	<CLS_ESCAPE: "$cls"> | 	<ESTM_BEGIN: "estm{"> | 	<ESTM_END: "}estm"> | 	<ESTM_ESCAPE: "$estm"> | 	<EXP_BEGIN: "exp{"> | 	<EXP_END: "}exp"> | 	<EXP_ESCAPE: "$exp"> | 	<ID_BEGIN: "id{"> | 	<ID_END: "}id"> | 	<ID_ESCAPE: "$id"> |        <NAMEID_ESCAPE: "$name"> | 	<IMP_BEGIN: "imp{"> | 	<IMP_END: "}imp"> | 	<IMP_ESCAPE: "$imp"> | 	<MOD_BEGIN: "mod{"> | 	<MOD_END: "}mod"> | 	<MOD_ESCAPE: "$mod"> | 	<MTH_BEGIN: "mth{"> | 	<MTH_END: "}mth"> | 	<MTH_ESCAPE: "$mth"> | 	<PLST_BEGIN: "plst{"> | 	<PLST_END: "}plst"> | 	<PLST_ESCAPE: "$plst"> | 	<PRG_BEGIN: "prg{"> | 	<PRG_END: "}prg"> | 	<STM_BEGIN: "stm{"> | 	<STM_END: "}stm"> | 	<STM_ESCAPE: "$stm"> | 	<STR_ESCAPE: "$str"> | 	<TLST_BEGIN: "tlst{"> | 	<TLST_END: "}tlst"> | 	<TLST_ESCAPE: "$tlst"> | 	<TYP_BEGIN: "typ{"> | 	<TYP_END: "}typ"> | 	<TYP_ESCAPE: "$typ"> | 	<VI_BEGIN: "vi{"> | 	<VI_END: "}vi"> | 	<VI_ESCAPE: "$vi"> | 	<VLST_BEGIN: "vlst{"> | 	<VLST_END: "}vlst"> | 	<VLST_ESCAPE: "$vlst"> | 	<XLST_BEGIN: "xlst{"> | 	<XLST_END: "}xlst"> | 	<XLST_ESCAPE: "$xlst"> | 
	<ALIAS: "alias"> | 	<AUGMENT: "augment"> | 	<ENVIRONMENT: "environment"> | 	<PARENT: "parent"> | 
    < OVERRIDES: "overrides" > |    < REFINES:   "refines" > | 
	< SOURCE: "SoUrCe" > |  < ROOT: "RooT"   > | 
	< LAYER: "layer" >
}


//-----------------------------------//
// Java code blocks:
//-----------------------------------//

// No JAVACODE blocks in Bali grammar.

//-----------------------------------//
// Bali productions:
//-----------------------------------//

AST_Program
	: [ PackageDeclaration ] [ AST_Imports ] [ AST_Class ]
								::program
	;

AEBody
	: "&" EqualityExpression				::AEBod
	;

AST_ArgList
	:  Expression ( "," Expression )*
	;

AST_ArrayInit
	: AI_ESCAPE "(" AST_Exp ")"			::AiEscape
	| ArrayInitializer  ::ArrayInit
	;

AST_Catches
	: ( Catch )+
	;

AST_Class
	: ( TypeDeclaration )+
	;

AST_Exp
	: Expression
	;

AST_ExpStmt
	: StatementExpression ( "," StatementExpression )*
	;

AST_FieldDecl
	: ( ClassBodyDeclaration )+
	;

AST_Imports
	: ( ImportDeclaration )+
	;

AST_Modifiers
	: ( Modifier )+
	;

AST_ParList
	: FormalParameter ( "," FormalParameter )*
	;

AST_QualifiedName
	: QName ( LOOKAHEAD(2) "." QName )*
	;

AST_Stmt
	: ( BlockStatement )+
	;

AST_SwitchEntry
	: ( SwitchEntryBody )+
	;

AST_TypeName
	: TYP_ESCAPE "(" AST_Exp ")"			::TypEscape
	| PrimitiveType [ LOOKAHEAD(2) Dims ]			::PrimType
	| AST_QualifiedName [ LOOKAHEAD(2) Dims ]		::QNameType
	;

AST_TypeNameList
	: TName ( "," TName )*
	;

AST_VarDecl
	: VariableDeclarator ( "," VariableDeclarator )*
	;

AST_VarInit
	: VI_ESCAPE "(" AST_Exp ")"			::ViEscape
	| "{" [ AST_ArrayInit ] [ "," ] "}"			::ArrInit
	| Expression						::VarInitExpr
	;

AdEBody
	: AddExprChoices MultiplicativeExpression		::AdEBod
	;

AddExprChoices
	: "+"							::Plus
	| "-"							::Minus
	;

AdditiveExpression
	: MultiplicativeExpression
	| MultiplicativeExpression MoreAddExpr			::AddExpr
	;

AllocExprChoices
	: ArrayDimsAndInits
	| Arguments [ ClassBody ]				::AnonClass
	;

AllocationExpression
	: LOOKAHEAD(2)
	  "new" PrimitiveType ArrayDimsAndInits			::PrimAllocExpr
	| "new" AST_QualifiedName AllocExprChoices		::ObjAllocExpr
	;

AndExpression
	: EqualityExpression
	| EqualityExpression MoreAndExpr			::AndExpr
	;

Arguments
	:  "(" [ AST_ArgList ] ")"				::Args
	;

ArrayDimsAndInits
	: LOOKAHEAD(2)
	  ExprDims [ LOOKAHEAD(2) Dims ]			::ArrDim1
	| Dims AST_ArrayInit					::ArrDim2
	;

ArrayInitializer
	: AST_VarInit ( LOOKAHEAD(2) "," AST_VarInit )*
	;

AssignmentOperator
	: "="							::Assign
	| "*="							::AssnTimes
	| "/="							::AssnDiv
	| "%="							::AssnMod
	| "+="							::AssnPlus
	| "-="							::AssnMinus
	| "<<="							::AssnShL
	| ">>="							::AssnShR
	| ">>>="						::AssnShRR
	| "&="							::AssnAnd
	| "^="							::AssnXor
	| "|="							::AssnOr
	;

Block
	:  "{" [ AST_Stmt ] "}"					::BlockC
	;

BlockStatement
	: LOOKAHEAD([ "final" ] AST_TypeName() <VLST_ESCAPE>)
	  LocalVariableDeclaration ";"			::VEStmt
	| LOOKAHEAD([ "final" ] AST_TypeName() <IDENTIFIER>)
	  LocalVariableDeclaration ";"				::BlockStmt
	| Statement
	| UnmodifiedClassDeclaration				::BlkClassDcl
	| UnmodifiedInterfaceDeclaration			::BlkInterDcl
	;

BooleanLiteral
	: "true"						::True
	| "false"						::False
	;

BreakStatement
	:  "break" [ QName ] ";"				::BreakStm
	;

CAEBody
	: "&&" InclusiveOrExpression				::CAEBod
	;

COEBody
	: "||" ConditionalAndExpression				::COEBod
	;

CastExpression
	:  LOOKAHEAD("(" PrimitiveType())
	  "(" AST_TypeName ")" UnaryExpression			::CastExpr1
	| "(" AST_TypeName ")" UnaryExpressionNotPlusMinus	::CastExpr2
	;

CastLookahead
	:  LOOKAHEAD(2)
	  "(" PrimitiveType					::Cla1
	| LOOKAHEAD("(" AST_QualifiedName() "[")
	  "(" AST_QualifiedName "[" "]"				::Cla2
	|  "(" AST_QualifiedName ")" CastLookaheadChoices	::Cla3
	;

CastLookaheadChoices
	: "Super"						:: CapSuperLA
	| "~"							::TildeLA
	| "!"							::BangLA
	| "("							::OpParenLA
	| IDENTIFIER						::IdLA
	| "this"						::ThisLA
	| "super"						::SuperLA
	| "new"							::NewLA
	| Literal						::LitLA
	;

Catch
	: CAT_ESCAPE "(" AST_Exp ")"			::CatEscape
	| "catch" "(" FormalParameter ")" Block			::CatchStmt
	;

ClassBody
	: "{" [ AST_FieldDecl ] "}"				::ClsBody
	;

ClassBodyDeclaration
	: LOOKAHEAD( [ AST_Modifiers() ] "state_machine" )
            NestedSmDeclaration
	| ConstructorRefinement
	| LOOKAHEAD(2) IDENTIFIER ";"			::MthIscape
	| MTH_ESCAPE "(" AST_Exp ")"			::MthEscape
	| LOOKAHEAD(2)
	  Initializer
	|
	  LOOKAHEAD( [ AST_Modifiers() ] "class" )
	  NestedClassDeclaration
	| LOOKAHEAD( [ AST_Modifiers() ] "interface" )
	  NestedInterfaceDeclaration
	| LOOKAHEAD( [ "public" | "protected" | "private" ] AST_QualifiedName() "(" )
	  ConstructorDeclaration
	| LOOKAHEAD( MethodDeclarationLookahead() )
	  MethodDeclaration
	| FieldDeclaration
	;

ConditionalAndExpression
	: InclusiveOrExpression
	| InclusiveOrExpression MoreCondAndExpr			::CondAndExpr
	;

ConditionalExpression
	: XLST_ESCAPE "(" AST_Exp ")"			::XlstEscape
	| JakartaSST
	| ConditionalOrExpression
	| ConditionalOrExpression "?" Expression ":" ConditionalExpression
								::QuestExpr
	;

ConditionalOrExpression
	: ConditionalAndExpression
	| ConditionalAndExpression MoreCondOrExpr		::CondOrExpr
	;

ConstructorDeclaration
	: [ AST_Modifiers ] QName "(" [ AST_ParList ] ")"
		[ ThrowsClause ] "{"
		[ LOOKAHEAD(ExplicitConstructorInvocation())
			ExplicitConstructorInvocation ]
		[ AST_Stmt ] "}"				::ConDecl
	;

ConstructorRefinement
	: REFINES QName "(" [ AST_ParList ] ")" "{" [  AST_Stmt ] "}" 
		:: RefCons
	;

ContinueStatement
	:  "continue" [ QName ] ";"				::ContinueStm
	;

DeclNameList
	: QName ( COMMA QName )*
	;

DelivClause
	: DELIVERY "(" AST_ParList ")" ";" 	:: DelivDecl
	;

Dim
	: "[" "]"						::Dim2
	;

Dims
	: ( LOOKAHEAD(2) Dim )+
	;

DoStatement
	:  "do" Statement "while" "(" Expression ")" ";"	::DoWhileStm
	;

DotTimes
	: "." "*"						::DotTimesC
	;

EEBody
	: EqExprChoices InstanceOfExpression			::EEBodyC
	;

EOEBody
	: "^" AndExpression					::EOEBod
	;

ESList
	: ( Es )+
	;

ElseClause
	: "else" Statement					::ElseClauseC
	;

EmptyStatement
	:  ";"							::Empty
	;

EqExprChoices
	: "=="							::Eq
	| "!="							::Neq
	;

EqualityExpression
	: InstanceOfExpression
	| InstanceOfExpression MoreEqExpr			::EqExpr
	;

Es
	: EXIT QName Block			:: ExitDecl
	| ENTER QName Block			:: EnterDecl
	| PREPARE QName Block			:: PrepareDecl
	| EDGETEST QName AST_Exp ";"            :: TestDecl
	| EDGEACTION QName Block                :: ActionDecl
	| EDGE QName ":" StartName ARROW QName
	  CONDITION AST_Exp DO Block 		:: TransitionDecl
	| OTHERWISE QName Block                 :: OtherDecl
	;

ExDimBody
	:"[" Expression "]"					::ExDimBod
	;

ExclusiveOrExpression
	: AndExpression
	| AndExpression MoreExclOrExpr				::ExclOrExpr
	;

ExplicitConstructorInvocation
	: LOOKAHEAD(3)
	  "Super" "(" [ AST_TypeNameList ] ")" Arguments ";" :: ConSSuper
	| LOOKAHEAD("this" Arguments() ";")
	  "this" Arguments ";"					::ConThis
	| [ LOOKAHEAD(2) PrimDot ] "super" Arguments ";"
								::ConSuper
	;

ExprDims
	: ( LOOKAHEAD(2) ExDimBody )+
	;

Expression
	: ConditionalExpression
	| ConditionalExpression AssignmentOperator Expression	::AsgExpr
	;

ExtendsClause
	: "extends" AST_QualifiedName				::ExtClause
	;

FieldDeclaration
	: ENVIRONMENT [ DeclNameList ] ";"			::Env
	| [ AST_Modifiers ] AST_TypeName AST_VarDecl ";"	::FldVarDec
	;

Finally
	: "finally" Block					::FinallyC
	;

ForInit
	: LOOKAHEAD( [ "final" ] AST_TypeName() <IDENTIFIER> )
	  LocalVariableDeclaration
	| StatementExpressionList				::FIExprList
	;

ForStatement
	:  "for" "(" [ ForInit ] ";" [ Expression ] ";" [ ForUpdate ] ")"
		Statement					::ForStmt
	;

ForUpdate
	: StatementExpressionList				::StmExprList
	;

FormalParameter
	: LOOKAHEAD(<IDENTIFIER> ( "," | ")" ) )
	  IDENTIFIER					::PlstIscape
	| PLST_ESCAPE "(" AST_Exp ")"			::PlstEscape
	| [ "final" ] AST_TypeName VariableDeclaratorId		::FormParDecl
	;

IOEBody
	: "|" ExclusiveOrExpression				::IOEBod
	;

IfStatement
	: "if" "(" Expression ")" Statement [ LOOKAHEAD(1) ElseClause ]
								::IfStmt
	;

ImplementsClause
	: "implements" AST_TypeNameList				::ImplClause
	;

ImportDeclaration
	: IMP_ESCAPE "(" AST_Exp ")" ";"		::ImpEscape
	| "import" AST_QualifiedName [ DotTimes ] ";"		::ImpQual
	;

InclusiveOrExpression
	: ExclusiveOrExpression
	| ExclusiveOrExpression MoreInclOrExpr			::InclOrExpr
	;

Initializer
	: [ "static" ] Block					::Init
	;

InstanceOfExpression
	: RelationalExpression
	| RelationalExpression "instanceof" AST_TypeName	::IoExpr
	;

IntExtClause
	: "extends" AST_TypeNameList				::IntExtClauseC
	;

InterfaceMemberDeclaration
	: LOOKAHEAD( [ AST_Modifiers() ] "class" )
	  NestedClassDeclaration				::NCDecl
	| LOOKAHEAD( [ AST_Modifiers() ] "interface" )
	  NestedInterfaceDeclaration				::NIDecl
	| LOOKAHEAD( MethodDeclarationLookahead() )
	  MethodDeclaration					::MDecl
	| FieldDeclaration					::FDecl
	;

InterfaceMemberDeclarations
	: (InterfaceMemberDeclaration)+
	;

JakartaSST
	: EXP_BEGIN  AST_Exp EXP_END			::AST_ExpC
	| STM_BEGIN [ AST_Stmt ] STM_END		::AST_StmtC
	| CASE_BEGIN AST_SwitchEntry CASE_END		::AST_SwitchEntryC
	| MTH_BEGIN [ AST_FieldDecl ] MTH_END		::AST_FieldDeclC
	| CLS_BEGIN [ AST_Class ] CLS_END		::AST_ClassC
	| PRG_BEGIN  AST_Program PRG_END		::AST_ProgramC
	| TYP_BEGIN  AST_TypeName TYP_END		::AST_TypeNameC
	| ID_BEGIN   AST_QualifiedName ID_END		::AST_QualifiedNameC
	| PLST_BEGIN [ AST_ParList ] PLST_END		::AST_ParListC
	| XLST_BEGIN [ AST_ArgList ] XLST_END		::AST_ArgListC
	| TLST_BEGIN AST_TypeNameList TLST_END		::AST_TypeNameListC
	| IMP_BEGIN [ AST_Imports ] IMP_END		::AST_ImportsC
	| MOD_BEGIN [ AST_Modifiers ] MOD_END		::AST_ModifiersC
	| VLST_BEGIN AST_VarDecl VLST_END		::AST_VarDeclC
	| VI_BEGIN   AST_VarInit VI_END			::AST_VarInitC
	| AI_BEGIN   AST_ArrayInit AI_END		::AST_ArrayInitC
	| ESTM_BEGIN AST_ExpStmt ESTM_END		::AST_ExpStmtC
	| CAT_BEGIN [ AST_Catches ] CAT_END		::AST_CatchesC
	;

LabeledStatement
	: QName ":" Statement					::LabeledStmt
	;

Literal
	: INTEGER_LITERAL					::IntLit
	| FLOATING_POINT_LITERAL				::FPLit
	| CHARACTER_LITERAL					::CharLit
	| STRING_LITERAL					::StrLit
	| BooleanLiteral
	| NullLiteral
	;

LocalVariableDeclaration
	:  [ "final" ] AST_TypeName AST_VarDecl			::LocalVarDecl
	;

MEBody
	: MultExprChoices UnaryExpression			::MEBod
	;

MethodDeclSuffix
	: Block							::MDSBlock
	| ";"							::MDSEmpty
	;

MethodDeclaration
	: [ AST_Modifiers ] AST_TypeName MethodDeclarator
	  [ ThrowsClause] MethodDeclSuffix			::MethodDcl
	;

MethodDeclarationLookahead
	: [ AST_Modifiers ] AST_TypeName QName "("		::MDeclLA
	;

MethodDeclarator
	: QName "(" [ AST_ParList ] ")" [ Dims ]		::MthDector
	;

Modifier
	:
	  NEW        :: ModNew
	| OVERRIDES  :: ModOverrides
	| MOD_ESCAPE "(" AST_Exp ")"			::ModEscape
	| ABSTRACT						::ModAbstract
	| FINAL							::ModFinal
	| PUBLIC						::ModPublic
	| PROTECTED						::ModProtected
	| PRIVATE						::ModPrivate
	| STATIC						::ModStatic
	| TRANSIENT						::ModTransient
	| VOLATILE						::ModVolatile
	| NATIVE						::ModNative
	| SYNCHRONIZED					::ModSynchronized
	;

MoreAddExpr
	: ( LOOKAHEAD(2) AdEBody )+
	;

MoreAndExpr
	: ( LOOKAHEAD(2) AEBody )+
	;

MoreCondAndExpr
	: ( LOOKAHEAD(2) CAEBody )+
	;

MoreCondOrExpr
	: ( LOOKAHEAD(2) COEBody )+
	;

MoreEqExpr
	: ( LOOKAHEAD(2) EEBody )+
	;

MoreExclOrExpr
	: ( LOOKAHEAD(2) EOEBody )+
	;

MoreInclOrExpr
	: ( LOOKAHEAD(2) IOEBody )+
	;

MoreMultExpr
	: ( LOOKAHEAD(2) MEBody )+
	;

MoreRelExpr
	: ( LOOKAHEAD(2) REBody )+
	;

MoreShiftExpr
	: ( LOOKAHEAD(2) SEBody )+
	;

MultExprChoices
	: "*"							::Mult
	| "/"							::Div
	| "%"							::Mod
	;

MultiplicativeExpression
	: UnaryExpression
	| UnaryExpression MoreMultExpr				::MultExpr
	;

NestedClassDeclaration
	: [ AST_Modifiers ] UnmodifiedClassDeclaration		::NClassDecl
	;

NestedInterfaceDeclaration
	: [ AST_Modifiers ] UnmodifiedInterfaceDeclaration	::NInterDecl
	;

NestedSmDeclaration
	: [ AST_Modifiers ] SmDeclaration	:: NSmDecl
	;

NoTransitionClause
	: UNRECOGNIZABLE_STATE Block		:: NoTransDecl
	;

NullLiteral
	: "null"						::Null
	;

OtherwiseClause
	: OTHERWISE_DEFAULT Block               :: ODefaultDecl
	;

OtherwiseClauses
	: ( OtherwiseClause )+
	;

PEPostIncDec
	: "++"							::PlusPlus2
	| "--"							::MinusMinus2
	;

PackageDeclaration
	: LAYER AST_QualifiedName ";"	::AspectStm
	| "package" AST_QualifiedName ";"			::PackStm
	;

PostfixExpression
	: PrimaryExpression
	| PrimaryExpression PEPostIncDec			::PEIncDec
	;

PreDecrementExpression
	: "--" PrimaryExpression				::PDecExpr
	;

PreIncrementExpression
	: "++" PrimaryExpression				::PIncExpr
	;

PrimDot
	: PrimaryExpression "."					::PrimDotC
	;

PrimaryExpression
	: PrimaryPrefix
	| PrimaryPrefix Suffixes				::PrimExpr
	;

PrimaryPrefix
	: PROCEED Arguments			:: ProceedDecl
	| "Super" "(" [ AST_TypeNameList ] ")" "." QName :: BasePre
	| StringEscape
	| EXP_ESCAPE "(" AST_Exp ")"			::ExpEscape
	| Literal
	| "this"						::ThisPre
	| "super" "." QName					::SuperPre
	| "(" Expression ")"					::ExprPre
	| AllocationExpression
	| LOOKAHEAD( AST_TypeName() "." "class" )
	  AST_TypeName "." "class"				::RTPre
	| AST_QualifiedName					::PPQualName
	;

PrimarySuffix
	: LOOKAHEAD(2)
	  "." "this"						::ThisSuf
	| LOOKAHEAD(2)
	  "." AllocationExpression				::AllocSuf
	| "[" Expression "]"					::ExprSuf
	| "." QName						::QNameSuf
	| Arguments						::MthCall
	;

PrimitiveType
	: "boolean"						::BoolTyp
	| "char"						::CharTyp
	| "byte"						::ByteTyp
	| "short"						::ShortTyp
	| "int"							::IntTyp
	| "long"						::LongTyp
	| "float"						::FloatTyp
	| "double"						::DoubleTyp
	| "void"						::VoidTyp
	;

QName
	: ID_ESCAPE "(" AST_Exp ")"			::IdEscape
	| NAMEID_ESCAPE "(" AST_Exp ")"			::NameIdEscape
	| IDENTIFIER						::NameId
	;

QNameList
	: QName ( "," QName)*
	;

REBody
	: RelExprChoices ShiftExpression			::REBod
	;

RelExprChoices
	: "<"							::LtOp
	| ">"							::GtOp
	| "<="							::LeOp
	| ">="							::GeOp
	;

RelationalExpression
	: ShiftExpression
	| ShiftExpression MoreRelExpr				::RelExpr
	;

ReturnStatement
	:  "return" [ Expression ] ";"				::ReturnStm
	;

RootClause
	: DelivClause [ NoTransitionClause ] 	:: RootDecl
	;

SEBody
	: ShiftExprChoices AdditiveExpression			::SEBodyC
	;

ShiftExprChoices
	: "<<"							::LShift
	| ">>"							::RShift
	| ">>>"							::RRShift
	;

ShiftExpression
	: AdditiveExpression
	| AdditiveExpression MoreShiftExpr			::ShiftExpr
	;

SmClassBody
	: "{" [ RootClause ] [ OtherwiseClauses ] [ StatesList ] [ ESList ] 
  	  [ AST_FieldDecl ] "}" 		:: SmClassDecl
	;

SmDeclaration
	: STATE_MACHINE QName [ SmExtendsClause ] 
          [ ImplementsClause ] SmClassBody 	:: UmodSmDecl
	;

SmExtendsClause
	: LOOKAHEAD(2) ExtendsClause                           :: SmExtends
	| LOOKAHEAD(2) "extends" "class" AST_QualifiedName     :: SmClsExtends
	;

StartName
	: QName					:: SmSName
	| "*"					:: StarName
	;

Statement
	: GOTO_STATE QName Arguments		:: GotoState
	| ALIAS "(" QName COMMA AST_Exp ")" ";"			::Alias
	| LOOKAHEAD(2) ENVIRONMENT AUGMENT AST_Exp ";"		::Augment
	| ENVIRONMENT PARENT AST_Exp ";"			::SetParent
	|STM_ESCAPE "(" AST_Exp ")" ";"			::StmEscape
	| LOOKAHEAD(QName() ":")
	  LabeledStatement
	| Block
	| EmptyStatement
	| SwitchStatement
	| IfStatement
	| WhileStatement
	| DoStatement
	| ForStatement
	| BreakStatement
	| ContinueStatement
	| ReturnStatement
	| ThrowStatement
	| SynchronizedStatement
	| TryStatement
	| AST_Exp ";"						::ExprStmt
	;

StatementExpression
	: ESTM_ESCAPE "(" AST_Exp ")"			::EstmEscape
	| PreIncrementExpression				::PIExpr
	| PreDecrementExpression				::PDExpr
	| PrimaryExpression [ StmtExprChoices ]			::PEStmtExpr
	;

StatementExpressionList
	:  StatementExpression ( "," StatementExpression )*
	;

StatesClause
	: STATES AST_TypeNameList ";"		:: StatesDecl
	| NESTED_STATE QName ":" AllocationExpression ";"  :: NStateDecl
	;

StatesList
	: (StatesClause)+
	;

StmtExprChoices
	: "++"							::PlusPlus
	| "--"							::MinusMinus
	| AssignmentOperator Expression				::AssnExpr
	;

StringEscape
	: STR_ESCAPE "(" AST_Exp ")"			::StrEscape
	;

Suffixes
	: ( LOOKAHEAD(2) PrimarySuffix )+
	;

SwitchEntryBody
	: CASE_ESCAPE "(" AST_Exp ")"			::SwEscape
	| SwitchLabel [ AST_Stmt ]				::SEBod
	;

SwitchLabel
	: "case" Expression ":"					::CaseLabel
	| "default" ":"						::DefLabel
	;

SwitchStatement
	:  "switch" "(" Expression ")" "{" [ AST_SwitchEntry ] "}"
								::SwitchStmt
	;

SynchronizedStatement
	:  "synchronized" "(" Expression ")" Block		::SyncStmt
	;

TName
	: TLST_ESCAPE "(" AST_Exp ")"			::TlstEscape
	| AST_TypeName						::TNClass
	;

ThrowStatement
	:  "throw" Expression ";"				::ThrowStm
	;

ThrowsClause
	: "throws" AST_TypeNameList				::ThrowsClauseC
	;

TryStatement
	: "try" Block [ AST_Catches ] [ Finally ]		::TryStmt
	;

TypeDeclaration
	: "Local_Id" QNameList ";"	:: LocalIdProd
	| SOURCE [ROOT] AST_QualifiedName STRING_LITERAL ";"   :: SourceDecl
	| CLS_ESCAPE "(" AST_Exp ")"			::ClsEscape
	| IDENTIFIER					::ClsIscape
	| [ AST_Modifiers ] UnmodifiedTypeDeclaration		::ModTypeDecl
	| ";"							::EmptyTDecl
	;

UnaryExpression
	: "+" UnaryExpression					::PlusUE
	| "-" UnaryExpression					::MinusUE
	| PreIncrementExpression
	| PreDecrementExpression
	| UnaryExpressionNotPlusMinus
	;

UnaryExpressionNotPlusMinus
	: "~"							::TildeUE
	| "!" UnaryExpression					::NotUE
	| LOOKAHEAD( CastLookahead() )
	  CastExpression
	| PostfixExpression
	;

UnmodifiedClassDeclaration
	: "class" QName [ ExtendsClause ] [ ImplementsClause ] ClassBody
								::UmodClassDecl
	;

UnmodifiedInterfaceDeclaration
	: "interface" QName [ IntExtClause ]
		"{" [ InterfaceMemberDeclarations ] "}"		::UmInterDecl
	;

UnmodifiedTypeDeclaration
	: SmDeclaration
	| REFINES UnmodifiedTypeExtension :: Ute
	| UnmodifiedClassDeclaration
	| UnmodifiedInterfaceDeclaration
	;

UnmodifiedTypeExtension
	: STATE_MACHINE QName [ ImplementsClause ] SmClassBody :: UmodSmExt
	| "interface" QName [ IntExtClause ]
		"{" [ InterfaceMemberDeclarations ] "}" ::UmodIntExt
	| "class" QName [ ImplementsClause ] ClassBody :: UmodClassExt
	| REFINES         ::UTEError
	;

VarAssign
	: "=" AST_VarInit					::VarAssignC
	;

VariableDeclarator
	: VLST_ESCAPE "(" AST_Exp ")"			::VlstEscape
	| VariableDeclaratorId [ VarAssign ]			::VarDecl
	;

VariableDeclaratorId
	: QName [ Dims ]					::DecNameDim
	;

WhileStatement
	:  "while" "(" Expression ")" Statement			::WhileStm
	;
