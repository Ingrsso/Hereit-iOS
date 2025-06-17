import ProjectDescription

let project = Project(
    name: "UIComponents",
    targets: [
        .target(
            name: "UIComponents",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.shared.uicomponents",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "SnapKit"),
                .project(target: "DesignSystem", path: "../DesignSystem")
            ]
        )
    ]
)
