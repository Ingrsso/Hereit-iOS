import ProjectDescription

let project = Project(
    name: "AuthDomain",
    targets: [
        .target(
            name: "AuthDomain",
            destinations: .iOS,
            product: .staticFramework,
        
            bundleId: "com.hereit.domain.auth",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)
