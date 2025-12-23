@preconcurrency import ProjectDescription

let defaultApp = Target.target(name: "Training-UIKit",
                               destinations: [.iPhone],
                               product: .app,
                               bundleId: "com.magnificat.Training-UIKit",
                               infoPlist: .extendingDefault(with: [
                                    "UIMainStoryboardFile": "",
                                    "UILaunchStoryboardName": "LaunchScreen"

                               ]),
                               sources: ["Training-UIKit/**/*.swift"],
                               resources: ["Training-UIKit/Resources/Assets.xcassets",
                                           "Training-UIKit/Resources/LaunchScreen.storyboard",
                                           "Training-UIKit/Resources/AppIcon.icon",
                                           "Training-UIKit/Resources/Animations/**/"],
                               dependencies: [
                                .external(name: "Alamofire"),
                                .external(name: "Lottie"),
                                .external(name: "Toolkit"),
                                .external(name: "Swinject"),
                                .external(name: "Logging")
                               ])

let project = Project(name: "Training-UIKit",
                      targets: [defaultApp])
