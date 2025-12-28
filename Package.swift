// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDVersion",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        // Platform-specific libraries - use the one matching your target platform
        .library(
            name: "SDiOSVersion",
            targets: ["SDiOSVersion"]
        ),
        .library(
            name: "SDMacVersion",
            targets: ["SDMacVersion"]
        ),
        .library(
            name: "SDwatchOSVersion",
            targets: ["SDwatchOSVersion"]
        ),
        .library(
            name: "SDtvOSVersion",
            targets: ["SDtvOSVersion"]
        )
    ],
    targets: [
        .target(
            name: "SDiOSVersion",
            dependencies: [],
            path: "SDVersion/SDiOSVersion",
            resources: [.process("../PrivacyInfo.xcprivacy")],
            publicHeadersPath: "."
        ),
        .target(
            name: "SDMacVersion",
            dependencies: [],
            path: "SDVersion/SDMacVersion",
            resources: [.process("../PrivacyInfo.xcprivacy")],
            publicHeadersPath: "."
        ),
        .target(
            name: "SDwatchOSVersion",
            dependencies: [],
            path: "SDVersion/SDwatchOSVersion",
            resources: [.process("../PrivacyInfo.xcprivacy")],
            publicHeadersPath: "."
        ),
        .target(
            name: "SDtvOSVersion",
            dependencies: [],
            path: "SDVersion/SDtvOSVersion",
            resources: [.process("../PrivacyInfo.xcprivacy")],
            publicHeadersPath: "."
        )
    ]
)
