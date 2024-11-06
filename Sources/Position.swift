struct Position: CustomStringConvertible {
    let line: Int
    let column: Int
    
    var description: String {
        return "line \(line), column \(column)"
    }
}