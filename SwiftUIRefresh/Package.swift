// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftUIRefresh",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftUIRefresh",
            targets: ["SwiftUIRefresh"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "SwiftUIRefresh",
            dependencies: ["Introspect"],
            path: "Sources"
        )
    ]
)
