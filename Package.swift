// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoneyHashCP",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MoneyHashCP",
            targets: ["MoneyHashCP"]
        )
    ],
    dependencies: [
        // MoneyHash links against the MoneyHashShared build it was released with,
        // so both packages are always pinned to the same version.
        .package(
            url: "https://github.com/MoneyHash/Moneyhash-Shared-CP",
            exact: "4.2.2"
        )
    ],
    targets: [
        .target(
            name: "MoneyHashCP",
            dependencies: [
                .target(name: "MoneyHash"),
                .product(name: "MoneyHashShared", package: "Moneyhash-Shared-CP")
            ]
        ),
        // Cross-platform (Flutter / React Native) build of MoneyHash: the
        // `MoneyHash-cocoapods.xcframework.zip` asset of the mobile-one release.
        .binaryTarget(
            name: "MoneyHash",
            url: "https://github.com/MoneyHash/Moneyhash-CP/releases/download/4.2.2/MoneyHash.xcframework.zip",
            checksum: "REPLACE_WITH_CHECKSUM"
        )
    ]
)
