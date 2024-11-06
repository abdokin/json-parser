struct Tokenizer {
    let input: String
    var index: String.Index
    var line: Int = 1
    var column: Int = 1
    
    init(_ input: String) {
        self.input = input
        self.index = input.startIndex
    }
    
    mutating func next() -> Token {
        while index < input.endIndex {
            let char = input[index]
            let currentPosition = Position(line: line, column: column)
            
            if char.isWhitespace {
                if char == "\n" {
                    line += 1
                    column = 1
                } else {
                    column += 1
                }
                index = input.index(after: index)
                continue
            }
            
            switch char {
            case "{":
                index = input.index(after: index)
                column += 1
                return Token(type: .LeftCurlyBrace, position: currentPosition)
            case "}":
                index = input.index(after: index)
                column += 1
                return Token(type: .RightCurlyBrace, position: currentPosition)
            case "[":
                index = input.index(after: index)
                column += 1
                return Token(type: .LeftSquareBracket, position: currentPosition)
            case "]":
                index = input.index(after: index)
                column += 1
                return Token(type: .RightSquareBracket, position: currentPosition)
            case ":":
                index = input.index(after: index)
                column += 1
                return Token(type: .Colon, position: currentPosition)
            case ",":
                index = input.index(after: index)
                column += 1
                return Token(type: .Comma, position: currentPosition)
            case "\"":
                let start = input.index(after: index)
                var end = start
                while end < input.endIndex && input[end] != "\"" {
                    if input[end] == "\n" {
                        line += 1
                        column = 1
                    } else {
                        column += 1
                    }
                    end = input.index(after: end)
                }
                let string = String(input[start..<end])
                index = input.index(after: end)
                column += 2 // for the quotes
                return Token(type: .String(string), position: currentPosition)
            case "t":
                index = input.index(after: index)
                column += 4 // "true"
                return Token(type: .TrueValue, position: currentPosition)
            case "f":
                index = input.index(after: index)
                column += 5 // "false"
                return Token(type: .FalseValue, position: currentPosition)
            case "n":
                index = input.index(after: index)
                column += 4 // "null"
                return Token(type: .NullValue, position: currentPosition)
            case "0"..."9", ".":
                let start = index
                var end = input.index(after: index)
                var length = 1
                while end < input.endIndex && (input[end].isNumber || input[end] == ".") {
                    end = input.index(after: end)
                    length += 1
                }
                let number = Double(input[start..<end])!
                index = end
                column += length
                return Token(type: .Number(number), position: currentPosition)
            default:
                index = input.index(after: index)
                column += 1
            }
        }
        return Token(type: .EOF, position: Position(line: line, column: column))
    }
    
    
    mutating func peek() -> Token {
        let currentIndex = index
        let currentLine = line
        let currentColumn = column
        let token = next()
        index = currentIndex
        line = currentLine
        column = currentColumn
        return token
    }
}