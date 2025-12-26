//
//  BaseScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 08..
//

import UIKit
import Toolkit

class StaticBaseScreen: UIViewController {
    deinit {
        if let languageObserver {
                NotificationCenter.default.removeObserver(languageObserver)
            }
    }
    
    private var languageObserver: NSObjectProtocol?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.anchorToSuperView()
        subscribeToLanguageChange()
    }
    
    func addView(_ view: UIView, spacing: CGFloat? = nil) {
        stackView.addArrangedSubview(view)
        if let spacing {
            stackView.addArrangedSubview(UIView.emptyFlexibleVerticalView(height: spacing))
        }
    }
    
    func addEmptyView() {
        stackView.addArrangedSubview(UIView.emptyFlexibleVerticalView())
    }
    
    func languageChanged() {
        // Override
    }
}

private extension StaticBaseScreen {
    func subscribeToLanguageChange() {
        languageObserver = NotificationCenter.default.addObserver(
            forName: .languageDidChange,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.languageChanged()
        }
    }
}


