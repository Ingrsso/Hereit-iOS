import ProjectDescription

let project = Project(
    name: "Presentation",
    targets: [
        .target(
            name: "Presentation",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.presentation",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "SnapKit"),
                .project(target: "Domain", path: "../Domain"),
                .project(target: "Data", path: "../Data"),
                .project(target: "Shared", path: "../Shared")
            ]
        )
    ]
)
