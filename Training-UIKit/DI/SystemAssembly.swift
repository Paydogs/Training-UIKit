//
//  SystemAssembly.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 13..
//

import Swinject
import Toolkit

final class SystemAssembly: Assembly {
    func assemble(container: Container) {
        registerUtils(to: container)
        registerScreens(to: container)
    }
    
    func registerUtils(to container: Container) {

    }
    
    func registerScreens(to container: Container) {
        container.register(RootScreen.self) { _ in
            RootScreen()
        }
        container.register(LoadingScreen.self) { _ in
            LoadingScreen()
        }
        .inObjectScope(.transient)
        
        container.register(DashboardScreen.self) { _ in
            DashboardScreen()
        }
        .inObjectScope(.container)
    }
}
