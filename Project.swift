@preconcurrency import ProjectDescription

let defaultApp = Target.target(name: "Training-UIKit",
                               destinations: [.iPhone],
                               product: .app,
                               bundleId: "com.magnificat.Training-UIKit",
                               infoPlist: .extendingDefault(with: [
                                "UILaunchScreen": ""
                               ]),
                               sources: ["Training-UIKit/**/*.swift"],
                               resources: ["Training-UIKit/Resources/Assets.xcassets",
                                           "Training-UIKit/Resources/Animations/**/"],
                               dependencies: [
                                .external(name: "Alamofire"),
                                .external(name: "Lottie"),
                                .external(name: "Toolkit"),
                                .external(name: "Factory")
                               ])

let project = Project(name: "Training-UIKit",
                      targets: [defaultApp])
