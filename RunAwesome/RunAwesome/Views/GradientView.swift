//
//  GradientView.swift
//  RunAwesome
//
//  Created by Eslam Ali  on 24/04/2022.
//

import UIKit


final class GradientView : UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    
     init(colors: [UIColor]) {
        super.init(frame: .zero)
        
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = colors.map {$0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

