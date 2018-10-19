# SwiduxEcho

This is the first middleware built for [Swidux](https://github.com/clmntcrl/swidux). It's a simple logger which print action and updated Swidux's store in the console. 

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

### [Carthage](https://github.com/Carthage/Carthage)

Add the following dependency to your Cartfile:

```
github "clmntcrl/swidux-echo" ~> 0.1.0
```

```
$ carthage update
```

You should encounter an issue because libraries using SwiftPM are not currently supported by Carthage. This can be resolved with the following: 

```
$ (cd Carthage/Checkouts/swidux-echo && swift package generate-xcodeproj)
$ carthage build
```


### [SwiftPM](https://github.com/apple/swift-package-manager)

Add package as dependency:

```swift
import PackageDescription

let package = Package(
    name: "AwesomeProjectName",
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux-echo.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "AwesomeProjectName", dependencies: ["SwiduxEcho"])
    ]
)
```

```
$ swift build
```

## License

SwiduxEcho is released under the MIT license. See [LICENSE](LICENSE) for details.
