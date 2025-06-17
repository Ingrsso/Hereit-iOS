// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: ["SnapKit": .framework]
    )
#endif

let package = Package(
    name: "Hereit",
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from:"5.7.1"))
    ],
    targets: [
        .target(
            name: "Hereit",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit")
            ]
        )
    ]
)
