// swift-tools-version:5.9
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
        .library(
            name: "SDVersion",
            targets: ["SDVersion"]
        ),
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
            name: "SDVersion",
            dependencies: [],
            path: "SDVersion",
            exclude: [
                "SDiOSVersion",
                "SDMacVersion",
                "SDwatchOSVersion",
                "SDtvOSVersion"
            ],
            sources: ["."],
            publicHeadersPath: "."
        ),
        .target(
            name: "SDiOSVersion",
            dependencies: [],
            path: "SDVersion/SDiOSVersion",
            publicHeadersPath: "."
        ),
        .target(
            name: "SDMacVersion",
            dependencies: [],
            path: "SDVersion/SDMacVersion",
            publicHeadersPath: "."
        ),
        .target(
            name: "SDwatchOSVersion",
            dependencies: [],
            path: "SDVersion/SDwatchOSVersion",
            publicHeadersPath: "."
        ),
        .target(
            name: "SDtvOSVersion",
            dependencies: [],
            path: "SDVersion/SDtvOSVersion",
            publicHeadersPath: "."
        )
    ]
)
