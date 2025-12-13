//
//  AppDelegate.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit
import Toolkit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var diContainer: DIContainer?
    var appController: AppController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let assembly = Assemblies()
        diContainer = assembly.collectDI()
        
        appController = diContainer?.resolve(AppController.self)
        window = appController?.appWindow
        
        window?.makeKeyAndVisible()
        
        return true
    }
}


extension AppDelegate {

}
