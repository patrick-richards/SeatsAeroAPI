// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SeatsAeroAPI",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "SeatsAeroAPI",
            targets: ["SeatsAeroAPI"]),
    ],
    targets: [
        .target(
            name: "SeatsAeroAPI",
            resources: [.process("airports.json")])
    ]
)
