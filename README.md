# SwiduxEcho

This is the first middleware built for [Swidux](https://github.com/clmntcrl/swidux). It's a simple logger which print action and updated Swidux's store in the console. 

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

Add the following dependency to your `Cartfile`:

```ruby
github "clmntcrl/swidux-echo" ~> 0.2
```

### [CocoaPods](https://cocoapods.org)

Add the following pod to your `Podfile`:

```ruby
pod 'SwiduxEcho', '~> 0.2'
```

### [SwiftPM](https://github.com/apple/swift-package-manager)

Add the package as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/clmntcrl/swidux-echo.git", from: "0.2.0"),
]
```

## License

SwiduxEcho is released under the MIT license. See [LICENSE](LICENSE) for details.
