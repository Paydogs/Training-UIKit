
// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "Toolkit": .framework,
            "Alamofire": .framework,
            "Lottie": .framework,
            "Swinject": .framework
        ],
        baseSettings: .settings(configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ])
    )

#endif

let package = Package(
    name: "Training-UIKit",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        .package(url: "https://github.com/airbnb/lottie-spm", from: "4.5.2"),
        .package(url: "https://github.com/Swinject/Swinject", from: "2.10.0"),
        .package(url: "https://github.com/Apple/swift-log", from: "1.8.0"),
//        .package(url: "https://github.com/paydogs/Toolkit", from: "1.0.0"),
        .package(path: "../../Toolkit")
    ],
    targets: [
    ]
)
