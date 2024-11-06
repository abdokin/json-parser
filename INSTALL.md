# Installation Instructions

## Prerequisites

- Swift 6.0 or later
- Git

## Clone the Repository

```sh
git clone https://github.com/abdokin/json-parser.git
cd json-parser
```

## Build the Project

To build the project and create a static executable, run the following command:

```sh
swift build -c release -Xswiftc -static-stdlib
```

## Run the Executable

After the build process completes, you can find the static executable in the `.build/release` directory. Run it using:

```sh
./.build/release/json-parser
```
