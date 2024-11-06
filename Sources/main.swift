import ArgumentParser
import Foundation

struct JsonParser: ParsableCommand {
    @Argument(help: "The path to the JSON file to parse.")
    var jsonFilePath: String

    func run() throws {
        let fileURL = URL(fileURLWithPath: jsonFilePath)
        let jsonData = try Data(contentsOf: fileURL)
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            throw NSError(domain: "JsonParserErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to read JSON file"])
        }
        var parser = Parser(jsonString)
        let ast = parser.parse()
        print(ast)
    }
}

JsonParser.main()