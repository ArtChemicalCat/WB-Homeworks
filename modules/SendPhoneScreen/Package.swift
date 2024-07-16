// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SendPhoneScreen",
    products: [
        .library(
            name: "SendPhoneScreen",
            targets: ["SendPhoneScreen"]),
    ],
    dependencies: [
        .package(path: "HomeWorkUI"),
    ],
    targets: [
        .target(
            name: "SendPhoneScreen",
            dependencies: [
                .product(name: "HomeWorkUI", package: "HomeWorkUI")
            ]
        ),
    ]
)
