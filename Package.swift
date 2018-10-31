// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiduxEcho",
    products: [
        .library(
            name: "SwiduxEcho",
            targets: ["SwiduxEcho"]),
    ],
    dependencies: [
        .package(url: "https://github.com/clmntcrl/swidux.git", from: "0.1.1"),
    ],
    targets: [
        .target(
            name: "SwiduxEcho",
            dependencies: ["Swidux"]),
        .testTarget(
            name: "SwiduxEchoTests",
            dependencies: ["Swidux", "SwiduxEcho"]),
    ]
)
