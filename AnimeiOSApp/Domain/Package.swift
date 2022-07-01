// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/kateinoigakukun/StubKit",
            from: Version(0, 1, 7)
        ),
        .package(
            url: "https://github.com/Moya/Moya",
            from: Version(15, 0, 0)
        )
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "StubKit", package: "StubKit"),
                .product(name: "Moya", package: "Moya"),
                .product(name: "CombineMoya", package: "Moya")
            ]),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]),
    ]
)
