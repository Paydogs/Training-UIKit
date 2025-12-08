//
//  AppController.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

class AppController {
    private lazy var mainWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = LoadingScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1  ) { [weak self] in
            window.rootViewController = MainAppScreen()
        }
        return window
    }()
    
    var appWindow: UIWindow {
        return mainWindow
    }
}
