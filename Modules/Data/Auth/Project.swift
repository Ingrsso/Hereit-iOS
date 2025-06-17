import ProjectDescription

let project = Project(
    name: "AuthData",
    targets: [
        .target(
            name: "AuthData",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.data.auth",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "AuthDomain", path: "../../Domain/Auth"),
            ]
        )
    ]
)
