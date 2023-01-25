// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "translateScript",
    platforms: [.macOS(.v13)],
    targets: [
        .executableTarget(name: "translateScript")
    ]
)
