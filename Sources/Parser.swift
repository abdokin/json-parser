struct Parser {
    var tokenizer: Tokenizer
    
    init(_ jsonString: String) {    
        self.tokenizer = Tokenizer(jsonString)
    }
    
    mutating func parse() -> Ast {
        return parseValue()
    }
    
    private mutating func expect(_ tokenType: TokenType) -> Token {
        let nextToken = tokenizer.next()
        if nextToken.type != tokenType {
            fatalError("Expected \(tokenType), but got \(nextToken.type) at \(nextToken.position)")
        }
        return nextToken
    }
    
    private mutating func parseValue() -> Ast {
        let token = tokenizer.next()
        switch token.type {
        case .String(let string):
            return Ast(string, position: token.position)
        case .Number(let number):
            return Ast(number, position: token.position)
        case .LeftCurlyBrace:
            return parseObject()
        case .LeftSquareBracket:
            return parseArray()
        case .TrueValue:
            return Ast(true, position: token.position)
        case .FalseValue:
            return Ast(false, position: token.position)
        case .NullValue:
            return Ast(nil, position: token.position)
        default:
            fatalError("Unexpected token \(token.type) at \(token.position)")
        }
    }
    
mutating func parseObject() -> Ast {
        var children: [Ast] = []
        while true {
            let token = tokenizer.next()
            switch token.type {
            case .RightCurlyBrace:
                return Ast("object", children)
            case .String(let key):
                let _ = self.expect(.Colon)
                let value = parseValue()
                children.append(Ast(key, [value]))
                
                let nextToken = tokenizer.next()
                if case .RightCurlyBrace = nextToken.type {
                    return Ast("object", children)
                }
                if case .Comma = nextToken.type {
                    continue
                }
            default:
                fatalError("Unexpected token \(token)")
            }
        }
    }

    mutating func parseArray() -> Ast {
        var children: [Ast] = []
        while true {

            let token = tokenizer.peek()
            switch token.type {
            case .RightSquareBracket:
                return Ast("array", children)
            default:
                let value = parseValue()
                children.append(value)
                let nextToken = tokenizer.peek()
                if case .RightSquareBracket = nextToken.type {
                    let _ = expect(.RightSquareBracket)
                    return Ast("array", children)
                }
                let _ = expect(.Comma)
            }
        }
    }
}