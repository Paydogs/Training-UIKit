//
//  UIView+Utils.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

extension UIView {
    func anchorToSuperView(top: Bool = true, bottom: Bool = true, leading: Bool = true, trailing: Bool = true) {
        guard let superview else { return }
        
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = top
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = bottom
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = leading
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = trailing
    }
}
