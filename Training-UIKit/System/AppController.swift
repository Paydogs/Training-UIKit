//
//  AppController.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit
import Swinject

class AppController {
    private weak var window: UIWindow?
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func start(in window: UIWindow, load: Bool = false) {
        Log.debug("AppController started")
        self.window = window
        window.makeKeyAndVisible()
        
        if load {
            window.rootViewController = resolver.get(LoadingScreen.self)
            
            Task.runOnMainThreadAfter(seconds: 2) {  [weak self] in
                guard let self, let window = self.window else { return }
                window.rootViewController = resolver.get(MainAppScreen.self)
            }

        } else {
            window.rootViewController = self.resolver.get(MainAppScreen.self)
        }
    }
}
