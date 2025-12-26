//
//  RootScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 26..
//

import UIKit

final class RootScreen: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = makeTabs()
    }

    private func makeTabs() -> [UIViewController] {
        let dashboard = makeNavigationController(
            root: DashboardScreen(),
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let settings = makeNavigationController(
            root: SettingsScreen(),
            image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill")
        )

        return [dashboard, settings]
    }

    private func makeNavigationController(
        root: UIViewController,
        image: UIImage?,
        selectedImage: UIImage?
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: root)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}
