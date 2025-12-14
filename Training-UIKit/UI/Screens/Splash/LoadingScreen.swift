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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseIn],
            animations: { [weak self] in
                self?.imageView.alpha = 1
            }
        )
    }
    
    func setupScreen() {
        self.view.backgroundColor = .white
        
        addView(imageView)
    }
}
