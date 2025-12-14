//
//  SystemAssembly.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 13..
//

import Swinject

final class SystemAssembly: Assembly {
    func assemble(container: Container) {
        print("Assembling SystemAssembly...")
        registerScreens(to: container)
    }
    
    func registerScreens(to container: Container) {
        container.register(LoadingScreen.self) { _ in
            LoadingScreen()
        }
        .inObjectScope(.transient)
        
        container.register(MainAppScreen.self) { _ in
            MainAppScreen()
        }
        .inObjectScope(.container)
    }
}
