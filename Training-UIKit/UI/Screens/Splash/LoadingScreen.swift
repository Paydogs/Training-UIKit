//
//  LoadingScreen.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 07..
//

import UIKit
import Toolkit
import Lottie

class LoadingScreen: StaticBaseScreen {
    override var prefersStatusBarHidden: Bool { true }
    
    lazy var imageView: UIAnimatedImageView = {
        let lottieView = UIAnimatedImageView(animation: .named("Splash"))
        lottieView.loopMode = .loop
        lottieView.play()
        return lottieView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    func setupScreen() {
        self.view.backgroundColor = .white

        addView(imageView)
    }
}
