# SwiduxEcho

This is the first middleware built for Swidux. It's a simple logger which print action and updated Swidux's store in the console. 

## Stability

This library should be considered alpha, and not stable. Breaking changes will happen often.

## Usage

You just have to pass `echo()`  into the `Store` init.

```swift
import Swidux
import SwiduxEcho

let store = Store<AppState>(
    initialState: AppState(),
    reducer: reducer,
    middlewares: [ echo() ]
)
```

## Installation

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux-echo.git", .branch("master")),
    ]
)
```

## License

SwiduxEcho is released under the MIT license. See [LICENSE](LICENSE) for details.
