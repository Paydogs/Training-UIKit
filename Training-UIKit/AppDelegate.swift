//
//  AppDelegate.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var appController: AppController = {
        return AppController()
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appController.appWindow.makeKeyAndVisible()
        return true
    }
}


extension AppDelegate {

}
