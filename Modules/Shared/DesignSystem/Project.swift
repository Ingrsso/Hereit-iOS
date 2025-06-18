import ProjectDescription

let project = Project(
    name: "DesignSystem",
    targets: [
        .target(
            name: "DesignSystem",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.hereit.shared.designsystem",
            infoPlist: (
                .extendingDefault(with: 
                [
                    "UIAppFonts": [
                        "Pretendard-Black.ttf",
                        "Pretendard-Bold.ttf",
                        "Pretendard-ExtraBold.ttf",
                        "Pretendard-ExtraLight.ttf",
                        "Pretendard-Light.ttf",
                        "Pretendard-Medium.ttf",
                        "Pretendard-Regular.ttf",
                        "Pretendard-SemiBold.ttf",
                        "Pretendard-Thin.ttf"
                    ]
                ])
            ),
            sources: ["Sources/**"],
            resources: [
                "Resources/**",
                "Resources/Fonts/**"
            ],
            dependencies: []
        )
    ]
)


