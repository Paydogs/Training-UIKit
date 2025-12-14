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
        label.text = "Hello UIKit!"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "More comming soon"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        addView(UIView.emptyView(height: 64))
        addView(titleLabel)
        addView(detailsLabel)
        addEmptyView()
    }
}

