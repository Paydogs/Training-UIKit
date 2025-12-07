//
//  LoadingScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit

class LoadingScreen: UIViewController {
    override var prefersStatusBarHidden: Bool { true }
    
    lazy var container: UIStackView = {
        let stackView = UIStackView()
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.anchorToSuperView()
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "SplashImage"))
        imageView.contentMode = .scaleAspectFit
        container.addArrangedSubview(imageView)
    }
}
