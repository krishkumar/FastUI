// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "FastUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FastUI",
            targets: ["FastUI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FastUI",
            dependencies: [],
            path: "Sources/Components")
    ]
)
