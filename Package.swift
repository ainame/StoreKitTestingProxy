// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoreKitTestingProxy",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "StoreKitTestingProxy", targets: ["StoreKitTestingProxy"])
    ],
    targets: [
        .target(
            name: "StoreKitTestingProxy",
            cSettings: [
                .headerSearchPath("include"),
            ]
        )
    ]
)
