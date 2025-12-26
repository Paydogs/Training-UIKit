//
//  DashboardScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

class DashboardScreen: StaticBaseScreen {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.bg1.color
        
        addView(UIView.emptyFlexibleVerticalView(height: 64))
        addView(titleLabel)
        addView(detailsLabel)
        addEmptyView()
        
        updateTexts()
    }
    
    func updateTexts() {
        titleLabel.text = Keys.dashboardTitleKey
        detailsLabel.text = Keys.dashboardSubtitleKey
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

