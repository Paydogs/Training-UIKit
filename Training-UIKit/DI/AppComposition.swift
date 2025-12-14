//
//  AppComposition.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 14..
//

import Swinject

enum AppComposition {
    static func composeAssembler() -> Assembler {
        Assembler(assemblies())
    }
    
    private static func assemblies() -> [Assembly] {
        [
            SystemAssembly()
        ]
    }
}
