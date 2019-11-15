//
//  AnimationButton.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/16.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

final class AnimationButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            let animationOptions: UIView.AnimationOptions = true ? [.allowUserInteraction] : []
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: animationOptions, animations: { [weak self] in
                guard let self = self else { return }
                self.transform = self.isHighlighted ? .init(scaleX: 0.7, y: 0.7) : .identity
            }, completion: nil)
        }
    }
}
