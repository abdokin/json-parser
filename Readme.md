# JSON Parser

## Purpose

This project is a simple JSON parser written in Swift.


## Features

- Parse JSON strings into 
- Print simple json AST
- Handle nested JSON structures
- Provide error handling for invalid JSON
## Example 

Here is an example of how to use the JSON parser to parse a JSON file and print its abstract syntax tree (AST):

```sh
swift run json-parser data/simple.json
```

The output will be a hierarchical representation of the JSON structure, as shown below:

```
    └─ object
        └─ name
            └─ John Doe (line 2, column 13)
        └─ age
            └─ 30.0 (line 3, column 12)
        └─ email
            └─ johndoe@example.com (line 4, column 14)
        └─ isStudent
            └─ false (line 5, column 18)
        └─ courses
            └─ array
                └─ Mathematics (line 7, column 9)
                └─ Computer Science (line 8, column 9)
        └─ address
            └─ object
                └─ street
                    └─ 123 Main St (line 11, column 19)
                └─ city
                    └─ New York (line 12, column 17)
                └─ state
                    └─ NY (line 13, column 18)
                └─ zip
                    └─ 10001 (line 14, column 16)
        └─ random
            └─ Null (line 16, column 15)
        └─ phoneNumbers
            └─ array
                └─ object
                    └─ type
                    └─ home (line 19, column 21)
                    └─ number
                    └─ 212-555-1234 (line 20, column 23)
                └─ object
                    └─ type
                    └─ work (line 23, column 21)
                    └─ number
                    └─ 646-555-1234 (line 24, column 23)
```

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/abdokin/json-parser.git
    ```
2. Navigate to the project directory:
    ```sh
    cd json-parser
    ```
3. Follow the instructions in the `INSTALL.md` file to set up the project.


## Contributing

Contributions are welcome! Please read the `CONTRIBUTING.md` file for guidelines on how to contribute to this project.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.