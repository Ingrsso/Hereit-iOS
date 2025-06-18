import ProjectDescription

let project = Project(
    name: "Domain",
    targets: [
        .target(
            name: "Domain",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.domain",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
