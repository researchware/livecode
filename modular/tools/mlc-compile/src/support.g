'module' support

'use'
    types

'export'
    IsBootstrapCompile

    NegateReal

    InitializePosition
    FinalizePosition
    AdvanceCurrentPosition
    AdvanceCurrentPositionToNextLine
    GetColumnOfCurrentPosition
    GetUndefinedPosition

    InitializeLiterals
    FinalizeLiterals
    MakeIntegerLiteral
    MakeDoubleLiteral
    MakeStringLiteral
    MakeNameLiteral
    GetStringOfNameLiteral

    InitializeScopes
    FinalizeScopes
    DumpScopes
    EnterScope
    LeaveScope
    DefineMeaning
    UndefineMeaning
    HasLocalMeaning
    HasMeaning

    PushEmptySet
    DuplicateSet
    ExchangeSet
    UnionSet
    IsIndexInSet
    IncludeIndexInSet
    ExcludeIndexFromSet

    ReorderOperatorExpression
    PopOperatorExpression
    PopOperatorExpressionArgument
    PushOperatorExpressionPrefix
    PushOperatorExpressionPostfix
    PushOperatorExpressionLeftBinary
    PushOperatorExpressionRightBinary
    PushOperatorExpressionNeutralBinary
    PushOperatorExpressionArgument
    PushOperatorExpressionOperand

    GenerateSyntaxRules
    DumpSyntaxRules
    BeginPhraseSyntaxRule
    BeginStatementSyntaxRule
    BeginExpressionSyntaxRule
    BeginPrefixOperatorSyntaxRule
    BeginPostfixOperatorSyntaxRule
    BeginLeftBinaryOperatorSyntaxRule
    BeginRightBinaryOperatorSyntaxRule
    BeginNeutralBinaryOperatorSyntaxRule
    EndSyntaxRule
    BeginSyntaxGrammar
    EndSyntaxGrammar
    ConcatenateSyntaxGrammar
    AlternateSyntaxGrammar
    RepeatSyntaxGrammar
    PushEmptySyntaxGrammar
    PushKeywordSyntaxGrammar
    PushMarkedDescentSyntaxGrammar
    PushDescentSyntaxGrammar
    PushMarkedTrueSyntaxGrammar
    PushMarkedFalseSyntaxGrammar
    PushMarkedIntegerSyntaxGrammar
    PushMarkedRealSyntaxGrammar
    PushMarkedStringSyntaxGrammar
    BeginSyntaxMappings
    EndSyntaxMappings
    BeginMethodSyntaxMapping
    EndMethodSyntaxMapping
    PushUndefinedArgumentSyntaxMapping
    PushTrueArgumentSyntaxMapping
    PushFalseArgumentSyntaxMapping
    PushIntegerArgumentSyntaxMapping
    PushRealArgumentSyntaxMapping
    PushStringArgumentSyntaxMapping
    PushMarkArgumentSyntaxMapping

    EmitBeginModule
    EmitEndModule
    EmitDefinitionIndex
    EmitExportedDefinition
    EmitModuleDependency
    EmitImportedType
    EmitImportedConstant
    EmitImportedVariable
    EmitImportedHandler
    EmitTypeDefinition
    EmitVariableDefinition
    EmitBeginHandlerDefinition
    EmitEndHandlerDefinition
    EmitForeignHandlerDefinition
    EmitNamedType
    EmitOptionalType
    EmitPointerType
    EmitBoolType
    EmitIntType
    EmitUIntType
    EmitFloatType
    EmitDoubleType
    EmitAnyType
    EmitBooleanType
    EmitIntegerType
    EmitRealType
    EmitNumberType
    EmitStringType
    EmitDataType
    EmitArrayType
    EmitListType
    EmitUndefinedType
    EmitBeginRecordType
    EmitRecordTypeField
    EmitEndRecordType
    EmitBeginHandlerType
    EmitHandlerTypeInParameter
    EmitHandlerTypeOutParameter
    EmitHandlerTypeInOutParameter
    EmitEndHandlerType
    EmitHandlerParameter
    EmitHandlerVariable
    EmitDeferLabel
    EmitResolveLabel
    EmitCreateRegister
    EmitDestroyRegister
    EmitJump
    EmitJumpIfTrue
    EmitJumpIfFalse
    EmitPushRepeatLabels
    EmitPopRepeatLabels
    EmitCurrentRepeatLabels
    EmitBeginInvoke
    EmitBeginIndirectInvoke
    EmitBeginBuiltinInvoke
    EmitContinueInvoke
    EmitEndInvoke
    EmitAssignUndefined
    EmitAssignTrue
    EmitAssignFalse
    EmitAssignInteger
    EmitAssignReal
    EmitAssignString
    EmitFetchLocal
    EmitStoreLocal
    EmitFetchGlobal
    EmitStoreGlobal
    EmitReturn
    EmitReturnNothing

    ErrorsDidOccur
    Fatal_OutOfMemory
    Fatal_InternalInconsistency
    Error_MalformedToken
    Error_MalformedSyntax
    Error_IdentifierPreviouslyDeclared
    Error_IdentifierNotDeclared
    Error_InvalidNameForSyntaxMarkVariable
    Error_SyntaxMarkVariableAlreadyDefined
    Error_ExpressionSyntaxCannotStartWithExpression
    Error_ExpressionSyntaxCannotFinishWithExpression
    Error_PrefixSyntaxCannotStartWithExpression
    Error_PrefixSyntaxMustFinishWithExpression
    Error_PostfixSyntaxMustStartWithExpression
    Error_PostfixSyntaxCannotFinishWithExpression
    Error_BinarySyntaxMustStartWithExpression
    Error_BinarySyntaxMustFinishWithExpression
    Error_ElementSyntaxCannotBeNullable
    Error_OnlyKeywordsAllowedInDelimiterSyntax
    Error_OptionalSyntaxCannotContainOnlyMarks
    Error_SyntaxMarksMustBeConstant
    Error_NotBoundToAType
    Error_NotBoundToAPhrase
    Error_NotBoundToASyntaxRule
    Error_NotBoundToASyntaxMark
    Error_NotBoundToAHandler
    Error_NotBoundToAVariable
    Error_NotBoundToAConstantSyntaxValue
    Error_NotBoundToAVariableOrHandler
    Error_TooManyArgumentsPassedToHandler
    Error_TooFewArgumentsPassedToHandler
    Error_HandlersBoundToSyntaxMustNotReturnAValue
    Error_SyntaxMarkVariableAlreadyDefinedWithDifferentType
    Error_ConstantSyntaxArgumentMustBindToInParameter
    Error_ContextSyntaxArgumentMustBindToInParameter
    Error_InputSyntaxArgumentMustBindToInParameter
    Error_OutputSyntaxArgumentMustBindToOutParameter
    Error_ContainerSyntaxArgumentMustBindToInParameter
    Error_IteratorSyntaxArgumentMustBindToInOutParameter
    Error_PhraseBoundMarkSyntaxArgumentMustBindToInParameter

--------------------------------------------------------------------------------

'condition' IsBootstrapCompile()

--------------------------------------------------------------------------------

'action' NegateReal(DOUBLE -> DOUBLE)

--------------------------------------------------------------------------------

'action' InitializePosition()
'action' FinalizePosition()

'action' AdvanceCurrentPosition(Delta: INT)
'action' AdvanceCurrentPositionToNextLine()

'action' GetColumnOfCurrentPosition(Position: POS -> Column: INT)

'action' GetUndefinedPosition(-> Position: POS)

--------------------------------------------------------------------------------

'action' InitializeLiterals()
'action' FinalizeLiterals()

'action' MakeIntegerLiteral(Token: STRING -> Literal: INT)
'action' MakeDoubleLiteral(Token: STRING -> Literal: DOUBLE)
'action' MakeStringLiteral(Token: STRING -> Literal: STRING)
'action' MakeNameLiteral(Token: STRING -> Literal: NAME)

'action' GetStringOfNameLiteral(Name: NAME -> String: STRING)

--------------------------------------------------------------------------------

'action' ReorderOperatorExpression
'condition' PopOperatorExpression(-> Position: POS, Method: INT, Arity: INT)
'action' PopOperatorExpressionArgument(-> EXPRESSION)

'action' PushOperatorExpressionPrefix(Position: POS, Precedence: INT, Method: INT)
'action' PushOperatorExpressionPostfix(Position: POS, Precedence: INT, Method: INT)
'action' PushOperatorExpressionLeftBinary(Position: POS, Precedence: INT, Method: INT)
'action' PushOperatorExpressionRightBinary(Position: POS, Precedence: INT, Method: INT)
'action' PushOperatorExpressionNeutralBinary(Position: POS, Precedence: INT, Method: INT)
'action' PushOperatorExpressionArgument(Operand: EXPRESSION)
'action' PushOperatorExpressionOperand(Argument: EXPRESSION)

--------------------------------------------------------------------------------

'action' InitializeScopes()
'action' FinalizeScopes()

'action' DumpScopes()

'action' EnterScope()
'action' LeaveScope()

'action' DefineMeaning(Name: NAME, Meaning: MEANING)
'action' UndefineMeaning(Name: NAME)
'condition' HasLocalMeaning(Name: NAME -> Meaning: MEANING)
'condition' HasMeaning(Name: NAME -> Meaning: MEANING)

--------------------------------------------------------------------------------

'action' PushEmptySet()
'action' DuplicateSet()
'action' ExchangeSet()
'action' UnionSet()
'action' IncludeIndexInSet(Index: INT)
'action' ExcludeIndexFromSet(Index: INT)
'condition' IsIndexInSet(Index: INT)

--------------------------------------------------------------------------------

'action' DumpSyntaxRules()

'action' GenerateSyntaxRules()

'action' BeginPhraseSyntaxRule(NAME)
'action' BeginStatementSyntaxRule(NAME)
'action' BeginExpressionSyntaxRule(NAME)
'action' BeginPrefixOperatorSyntaxRule(NAME, INT)
'action' BeginPostfixOperatorSyntaxRule(NAME, INT)
'action' BeginLeftBinaryOperatorSyntaxRule(NAME, INT)
'action' BeginRightBinaryOperatorSyntaxRule(NAME, INT)
'action' BeginNeutralBinaryOperatorSyntaxRule(NAME, INT)
'action' EndSyntaxRule()

'action' BeginSyntaxGrammar()
'action' EndSyntaxGrammar()

'action' ConcatenateSyntaxGrammar()
'action' AlternateSyntaxGrammar()
'action' RepeatSyntaxGrammar()
'action' PushEmptySyntaxGrammar()
'action' PushKeywordSyntaxGrammar(Token: STRING)
'action' PushMarkedDescentSyntaxGrammar(Index: INT, Rule: NAME)
'action' PushDescentSyntaxGrammar(Rule: NAME)
'action' PushMarkedTrueSyntaxGrammar(Index: INT)
'action' PushMarkedFalseSyntaxGrammar(Index: INT)
'action' PushMarkedIntegerSyntaxGrammar(Index: INT, Value: INT)
'action' PushMarkedRealSyntaxGrammar(Index: INT, Value: DOUBLE)
'action' PushMarkedStringSyntaxGrammar(Index: INT, Value: STRING)

'action' BeginSyntaxMappings()
'action' EndSyntaxMappings()

'action' BeginMethodSyntaxMapping(Name: NAME)
'action' EndMethodSyntaxMapping()
'action' PushUndefinedArgumentSyntaxMapping()
'action' PushTrueArgumentSyntaxMapping()
'action' PushFalseArgumentSyntaxMapping()
'action' PushIntegerArgumentSyntaxMapping(Value: INT)
'action' PushRealArgumentSyntaxMapping(Value: DOUBLE)
'action' PushStringArgumentSyntaxMapping(Value: STRING)
'action' PushMarkArgumentSyntaxMapping(MarkIndex: INT)
'action' PushIndexedMarkArgumentSyntaxMapping(MarkIndex: INT, Index: INT)

--------------------------------------------------------------------------------

'action' EmitBeginModule(Name: NAME -> ModuleIndex: INT)
'action' EmitEndModule()

'action' EmitModuleDependency(Name: NAME -> ModuleIndex: INT)

'action' EmitImportedType(ModuleIndex: INT, Name: NAME, TypeIndex: INT -> Index: INT)
'action' EmitImportedConstant(ModuleIndex: INT, Name: NAME, TypeIndex: INT -> Index: INT)
'action' EmitImportedVariable(ModuleIndex: INT, Name: NAME, TypeIndex: INT -> Index: INT)
'action' EmitImportedHandler(ModuleIndex: INT, Name: NAME, TypeIndex: INT -> Index: INT)

'action' EmitExportedDefinition(Index: INT)

'action' EmitDefinitionIndex(-> Index: INT)

'action' EmitTypeDefinition(Index: INT, Position: POS, Name: NAME, TypeIndex: INT)
'action' EmitVariableDefinition(Index: INT, Position: POS, Name: NAME, TypeIndex: INT)
'action' EmitBeginHandlerDefinition(Index: INT, Position: POS, Name: NAME, TypeIndex: INT)
'action' EmitEndHandlerDefinition()
'action' EmitForeignHandlerDefinition(Index: INT, Position: POS, Name: NAME, TypeIndex: INT, Binding: STRING)

'action' EmitOptionalType(INT -> INT)
'action' EmitNamedType(INT -> INT)
'action' EmitPointerType(-> INT)
'action' EmitBoolType(-> INT)
'action' EmitIntType(-> INT)
'action' EmitUIntType(-> INT)
'action' EmitFloatType(-> INT)
'action' EmitDoubleType(-> INT)
'action' EmitAnyType(-> INT)
'action' EmitBooleanType(-> INT)
'action' EmitIntegerType(-> INT)
'action' EmitRealType(-> INT)
'action' EmitNumberType(-> INT)
'action' EmitStringType(-> INT)
'action' EmitDataType(-> INT)
'action' EmitArrayType(-> INT)
'action' EmitListType(-> INT)
'action' EmitUndefinedType(-> INT)

'action' EmitBeginRecordType(BaseType: INT)
'action' EmitRecordTypeField(Name: NAME, Type: INT)
'action' EmitEndRecordType(-> INT)

'action' EmitBeginHandlerType(ReturnType: INT)
'action' EmitHandlerTypeInParameter(Name: NAME, Type: INT)
'action' EmitHandlerTypeOutParameter(Name: NAME, Type: INT)
'action' EmitHandlerTypeInOutParameter(Name: NAME, Type: INT)
'action' EmitEndHandlerType(-> INT)

'action' EmitHandlerParameter(Name: NAME, Type: INT -> Index: INT)
'action' EmitHandlerVariable(Name: NAME, Type: INT -> Index: INT)
'action' EmitDeferLabel(-> Label: INT)
'action' EmitResolveLabel(Label: INT)
'action' EmitCreateRegister(-> Register: INT)
'action' EmitDestroyRegister(Register: INT)
'action' EmitJump(Label: INT)
'action' EmitJumpIfTrue(Register: INT, Label: INT)
'action' EmitJumpIfFalse(Register: INT, Label: INT)
'action' EmitPushRepeatLabels(Head: INT, Tail: INT)
'action' EmitCurrentRepeatLabels(-> Next: INT, Exit: INT)
'action' EmitPopRepeatLabels()
'action' EmitBeginInvoke(Index: INT, ResultRegister: INT)
'action' EmitBeginIndirectInvoke(Register: INT, ResultRegister: INT)
'action' EmitBeginBuiltinInvoke(Name: STRING, ResultRegister: INT)
'action' EmitContinueInvoke(Register: INT)
'action' EmitEndInvoke()
'action' EmitAssignUndefined(Register: INT)
'action' EmitAssignTrue(Register: INT)
'action' EmitAssignFalse(Register: INT)
'action' EmitAssignInteger(Register: INT, Value: INT)
'action' EmitAssignReal(Register: INT, Value: DOUBLE)
'action' EmitAssignString(Register: INT, Value: STRING)
'action' EmitFetchLocal(Register: INT, Var: INT)
'action' EmitStoreLocal(Register: INT, Var: INT)
'action' EmitFetchGlobal(Register: INT, Var: INT)
'action' EmitStoreGlobal(Register: INT, Var: INT)
'action' EmitReturn(Register: INT)
'action' EmitReturnNothing()

--------------------------------------------------------------------------------

'condition' ErrorsDidOccur()

'action' Fatal_OutOfMemory()
'action' Fatal_InternalInconsistency(Message: STRING)
'action' Error_MalformedToken(Position: POS, Token: STRING)
'action' Error_MalformedSyntax(Position: POS)
'action' Error_IdentifierPreviouslyDeclared(Position: POS, Identifier: NAME, PreviousPosition: POS)
'action' Error_IdentifierNotDeclared(Position: POS, Identifier: NAME)
'action' Error_InvalidNameForSyntaxMarkVariable(Position: POS, Name: NAME)
'action' Error_SyntaxMarkVariableAlreadyDefined(Position: POS, Name: NAME)

'action' Error_ExpressionSyntaxCannotStartWithExpression(Position: POS)
'action' Error_ExpressionSyntaxCannotFinishWithExpression(Position: POS)
'action' Error_PrefixSyntaxCannotStartWithExpression(Position: POS)
'action' Error_PrefixSyntaxMustFinishWithExpression(Position: POS)
'action' Error_PostfixSyntaxMustStartWithExpression(Position: POS)
'action' Error_PostfixSyntaxCannotFinishWithExpression(Position: POS)
'action' Error_BinarySyntaxMustStartWithExpression(Position: POS)
'action' Error_BinarySyntaxMustFinishWithExpression(Position: POS)
'action' Error_ElementSyntaxCannotBeNullable(Position: POS)
'action' Error_OnlyKeywordsAllowedInDelimiterSyntax(Position: POS)
'action' Error_OptionalSyntaxCannotContainOnlyMarks(Position: POS)
'action' Error_SyntaxMarksMustBeConstant(Position: POS)

'action' Error_NotBoundToAType(Position: POS, Name: NAME)
'action' Error_NotBoundToAPhrase(Position: POS, Name: NAME)
'action' Error_NotBoundToASyntaxRule(Position: POS, Name: NAME)
'action' Error_NotBoundToASyntaxMark(Position: POS, Name: NAME)
'action' Error_NotBoundToAConstantSyntaxValue(Position: POS, Name: NAME)
'action' Error_NotBoundToAHandler(Position: POS, Name: NAME)
'action' Error_NotBoundToAVariable(Position: POS, Name: NAME)
'action' Error_NotBoundToAVariableOrHandler(Position: POS, Name: NAME)

'action' Error_TooManyArgumentsPassedToHandler(Position: POS)
'action' Error_TooFewArgumentsPassedToHandler(Position: POS)
'action' Error_HandlersBoundToSyntaxMustNotReturnAValue(Position: POS)
'action' Error_SyntaxMarkVariableAlreadyDefinedWithDifferentType(Position: POS, Name: NAME)
'action' Error_ConstantSyntaxArgumentMustBindToInParameter(Position: POS)
'action' Error_ContextSyntaxArgumentMustBindToInParameter(Position: POS)
'action' Error_InputSyntaxArgumentMustBindToInParameter(Position: POS)
'action' Error_OutputSyntaxArgumentMustBindToOutParameter(Position: POS)
'action' Error_ContainerSyntaxArgumentMustBindToInParameter(Position: POS)
'action' Error_IteratorSyntaxArgumentMustBindToInOutParameter(Position: POS)
'action' Error_PhraseBoundMarkSyntaxArgumentMustBindToInParameter(Position: POS)

--------------------------------------------------------------------------------
