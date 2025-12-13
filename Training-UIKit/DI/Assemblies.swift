//
//  Assemblies.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 13..
//

import Toolkit

struct Assemblies {
    func collectDI() -> DIContainer {
        let container = DIContainer()
        
        BaseAssembly.register(in: container)
        
        return container
    }
}

struct BaseAssembly {
    static func register(in container: DIContainer) {
        container.register(AppController.self, scope: .shared) { _ in
            AppController()
        }
    }
}
