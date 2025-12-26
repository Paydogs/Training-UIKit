//
//  SettingsScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 26..
//

import UIKit

class SettingsScreen: StaticBaseScreen {
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
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var schemeSwitch: LabeledAdaptiveSelectorView = {
        let view = LabeledAdaptiveSelectorView(title: Keys.settingsScreenDarkModeRowKey)
        return view
    }()
    
    lazy var languageSwitch: LabeledAdaptiveSelectorView = {
        let view = LabeledAdaptiveSelectorView(title: Keys.settingsScreenLanguageRowKey)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.bg1.color
        
        addView(UIView.emptyFlexibleVerticalView(height: 64))
        addView(titleLabel)
        addView(detailsLabel)
        addView(contentStackView)
        contentStackView.addArrangedSubview(languageSwitch)
        contentStackView.addArrangedSubview(schemeSwitch)
        addEmptyView()
        
        updateTexts()
//        
//        lightModeButton.addAction(
//            UIAction { [weak self] _ in
//                self?.switchLanguage()
//            },
//            for: .touchUpInside
//        )
        
        languageSwitch.onChanged = { selectedOption in
            guard let languageCode = LanguageCode(rawValue: selectedOption.id) else { return }
            Localization.sharedInstance.setLanguage(languageCode)
        }
        
        schemeSwitch.onChanged = { [weak self] selectedOption in
            guard let scheme = ColorScheme(rawValue: selectedOption.id) else { return }
            self?.setColorScheme(scheme)
        }
    }
    
    func setColorScheme(_ scheme: ColorScheme) {
        guard let window = self.view.window else { return }
        switch scheme {
        case .light:
            window.overrideUserInterfaceStyle = .light
        case .dark:
            window.overrideUserInterfaceStyle = .dark
        case .auto:
            window.overrideUserInterfaceStyle = .unspecified
        }
    }
    
    func updateTexts() {
        titleLabel.text = Keys.settingsScreenTitleKey
        detailsLabel.text = Keys.settingsScreenSubtitleKey
        languageSwitch.setTitle(Keys.settingsScreenLanguageRowKey)
        schemeSwitch.setTitle(Keys.settingsScreenDarkModeRowKey)
        languageSwitch.setOptions([.init(id: LanguageCode.en.rawValue, title: LanguageCode.en.localizedValue),
                                   .init(id: LanguageCode.hu.rawValue, title: LanguageCode.hu.localizedValue)])
        schemeSwitch.setOptions([.init(id: ColorScheme.light.rawValue, title: ColorScheme.light.localizedValue),
                                 .init(id: ColorScheme.dark.rawValue, title: ColorScheme.dark.localizedValue),
                                 .init(id: ColorScheme.auto.rawValue, title: ColorScheme.auto.localizedValue)])
    }
    
    override func languageChanged() {
        updateTexts()
        languageSwitch.setSelected(id: Localization.sharedInstance.currentLanguageCode.rawValue)
    }
}

