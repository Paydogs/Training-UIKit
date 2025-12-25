//
//  MainAppScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

class MainAppScreen: StaticBaseScreen {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primary.color
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.primary.color
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var lightModeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Localization.sharedInstance.currentLanguageCode.localizedValue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.bg1.color
        
        addView(UIView.emptyView(height: 64))
        addView(titleLabel)
        addView(detailsLabel)
        addView(lightModeButton)
        addEmptyView()
        
        updateTexts()
        
        lightModeButton.addAction(
            UIAction { [weak self] _ in
                self?.switchLanguage()
            },
            for: .touchUpInside
        )
    }
    
    func updateTexts() {
        titleLabel.text = Keys.dashboardTitleKey
        detailsLabel.text = Keys.dashboardSubtitleKey
        lightModeButton.setTitle(Localization.sharedInstance.currentLanguageCode.localizedValue, for: .normal)
    }
    
    override func languageChanged() {
        updateTexts()
    }
    
    private func switchLanguage() {
        let currentLanguage = Localization.sharedInstance.currentLanguageCode
        switch currentLanguage {
        case .en:
            Localization.sharedInstance.setLanguage(.hu)
        case .hu:
            Localization.sharedInstance.setLanguage(.en)
        }
    }
}

