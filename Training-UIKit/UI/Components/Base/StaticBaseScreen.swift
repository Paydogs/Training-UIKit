//
//  BaseScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 08..
//

import UIKit
import Toolkit

class StaticBaseScreen: UIViewController {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.anchorToSuperView()
    }
    
    func addView(_ view: UIView, spacing: CGFloat? = nil) {
        stackView.addArrangedSubview(view)
        if let spacing {
            stackView.addArrangedSubview(UIView.emptyView(height: spacing))
        }
    }
    
    func addEmptyView() {
        stackView.addArrangedSubview(UIView.emptyView())
    }
}
