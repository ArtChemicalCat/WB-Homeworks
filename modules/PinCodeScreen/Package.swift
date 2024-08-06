// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PinCodeScreen",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PinCodeScreen",
            targets: ["PinCodeScreen"]
        ),
    ],
    dependencies: [
        .package(path: "HomeWorkUI"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PinCodeScreen",
            dependencies: [
                .product(name: "HomeWorkUI", package: "HomeWorkUI")
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")]
        ),
    ]
)
