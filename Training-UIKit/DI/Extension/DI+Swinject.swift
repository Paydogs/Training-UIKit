//
//  DI+Swinject.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 17..
//

import Swinject

extension Resolver {
    func get<T>(
        _ type: T.Type = T.self,
        name: String? = nil,
        file: StaticString = #fileID,
        line: UInt = #line
    ) -> T {
        guard let instance = resolve(type, name: name) else {
            fatalError("Could not resolve \(type)" + (name.map { " (name: \($0))" } ?? ""), file: file, line: line)
        }
        return instance
    }
}
