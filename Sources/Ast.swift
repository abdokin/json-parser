struct Ast: CustomStringConvertible {
    let value: Any?
    let children: [Ast]
    let position: Position?
    
    init(_ value: Any, _ children: [Ast] = [], position: Position? = nil) {
        self.value = value
        self.children = children
        self.position = position
    }
    init(_ value: Any?, _ children: [Ast] = [], position: Position? = nil) {
        self.value = value
        self.children = children
        self.position = position
    }
    
    var description: String {
        return buildTree()
    }
    
    private func buildTree(indent: String = "") -> String {
        let posInfo = position.map { " (\($0))" } ?? ""
        let currentNode = "\(indent)└─ \(value ?? "Null")\(posInfo)"
        
        if children.isEmpty {
            return currentNode
        }
        
        return currentNode + "\n" + children.map { child in
            child.buildTree(indent: indent + "   ")
        }.joined(separator: "\n")
    }
}