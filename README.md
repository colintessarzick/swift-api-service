# Swift API Service

This is a simple API service written in Swift. It uses [Vapor](https://vapor.codes) for the web framework.

## Contributing

### Naming conventions
To provide a consistant developer experience, all names for classes, functions, file names, variables & constants have to meet the following guidelines:

#### Class Names
All classes that have at least `public` scope, need to start with the library identifier `SAS`, followed by the class name itself, written in `PascalCase`, where the first letter is capitalized.

Classes that have `internal` or lower scope, can ommit the library identifier, but have to still be written in `PascalCase`.

Example public class:
```swift
public class SASAPIClient: NSObject {
    public static let shared: SASAPIClient = {
        let client = SASAPIClient()
        return client
    }()
    var apiURL: URL! = URL(string: APIBaseURL)
    func configuredRequest(for url: URL) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: url)
        return request
    }
    ...
}
```
Example internal class:
```swift
class APIRequest<ResponseType: SASAPIResponseDecodable: NSObject {
    typealias SASAPIResponseBlock = (ResponseType?, HTTPURLResponse?, Error?) -> Void
    class func someFunctionName() {
        ...
    }
    ...
}
```

---

#### File Names
The file name is defined according to it's content. If the primary content of the file is a custom class, the filename must match the name of the class. If the primary content is an extension of a third-party library, the filename is `third-party class name + SwiftAPIService` (written without any whitespaces).

Default file name example:
```shell
ClassName.swift
```
```shell
SASAPIClient.swift
```

Extension file name example:
```shell
ThirdPartyClassName+SwiftAPIService.filetype
```
```shell
URLEncoder+SwiftAPIService.swift
```

There is one exception to the file naming conventions specified above. In case the file is meant as an extension and contains only one function or specific purpose, the file will be named according to that specific purpose instead of `+SwiftAPIService`.

Single purpose Extension example:
```shell
ThirdPartClassName+Purpose.filetype
```
```shell
URLSession+Retry.swift
```

---

#### Function Names
Like the file naming conventions, there are two different types of functions. The type of function is part of a custom class or global file scope. Those functions are written in `camelCase`.
The second type of function is part of an extension for a third party library, as specified above. Those functions are written in `camelCase` as well + that they start with `sas_`.

Default function example:
```swift
someFunctionName(parameter: DataType) { }
```
Function inside a third party library extension example:
```swift
sas_someFunctionName(parameter: DataType) { }
```

---

#### Variable & Constant Names
Variables and constants are always written in `camelCase`. The only exception are global constants at file level - those are written in `PascalCase`.

Default example:
```swift
var myGenericVariable: Int = 5
let myGenericConstant: String = "This is a fixed string"
```

Global file scope example:
```swift
private let APIVersion = "2021-09-23"
```

### Commit Conventions
This project follows the **Conventional Commit specification** throughout. It is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of.

The commit message should be structured as follows:
```shell
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```

The commit contains the following structural elements, to communicate intent to the consumers of your library:
1. **fix**: a commit of the type `fix` patches a bug in your codebase (this correlates with [`PATCH`](http://semver.org/#summary) in Semantic Versioning).
2. **feat**: a commit of the type `feat` introduces a new feature to the codebase (this correlates with [`MINOR`](http://semver.org/#summary) in Semantic Versioning).
3. **BREAKING CHANGE**: a commit that has a footer `BREAKING CHANGE`:, or appends a `!` after the type/scope, introduces a breaking API change (correlating with [`MAJOR`](http://semver.org/#summary) in Semantic Versioning). A `BREAKING CHANGE` can be part of commits of any type.
4. types other than `fix`: and `feat`: are allowed, for example [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional) (based on the the [Angular convention](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)) recommends `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:`, and others.
5. footers other than `BREAKING CHANGE: <description>` may be provided and follow a convention similar to [git trailer format](https://git-scm.com/docs/git-interpret-trailers).

---

Additional types are not mandated by the Conventional Commits specification, and have no implicit effect in Semantic Versioning (unless they include a BREAKING CHANGE). A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., `feat(parser): add ability to parse arrays`.

---

For further details and a complete guide to all specifications as well as examples, visit [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).