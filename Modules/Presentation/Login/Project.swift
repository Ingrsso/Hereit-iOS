import ProjectDescription

let project = Project(
    name: "Login",
    targets: [
        .target(
            name: "Login",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.presentation.login",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "SnapKit"),
                .project(target: "AuthDomain", path: "../../Domain/Auth"),
                .project(target: "AuthData", path: "../../Data/Auth"),
                .project(target: "UIComponents", path: "../../Shared/UIComponents"),
                .project(target: "DesignSystem", path: "../../Shared/DesignSystem")
            ]
        )
    ]
)
