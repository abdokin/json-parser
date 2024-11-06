enum TokenType: Equatable {
    case LeftCurlyBrace
    case RightCurlyBrace
    case LeftSquareBracket
    case RightSquareBracket
    case Colon
    case Comma
    case String(String)
    case Number(Double)
    case TrueValue
    case FalseValue
    case NullValue
    case EOF
}

struct Token {
    let type: TokenType
    let position: Position
}