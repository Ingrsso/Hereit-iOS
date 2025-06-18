import ProjectDescription

let project = Project(
    name: "Data",
    targets: [
        .target(
            name: "Data",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.data",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
