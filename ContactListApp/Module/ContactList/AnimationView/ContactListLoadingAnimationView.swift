//
//  ContactListLoadingAnimationView.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactListLoadingAnimationView: BaseAnimationView {

    fileprivate var animationView: UIView!
    fileprivate var animationColor: UIColor!
    
    fileprivate var dotLayer: CALayer!
    fileprivate var replicatorLayer: CAReplicatorLayer!
    
    fileprivate var animationGroup: CAAnimationGroup!
    fileprivate var animating: Bool = false;
    
    let initialOpacity: Float = 0.2
    let instanceCount: Int = 12
    let duration: TimeInterval = 1.25
    let animationKeyPath: String = "LoadingAnimation"

    fileprivate var textLabel: UILabel!
    
    var opacityAnimation: CABasicAnimation {
        let a = CABasicAnimation(keyPath: "opacity")
        a.fromValue = initialOpacity
        a.toValue = 1
        
        return a
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Subviews
    private func initSubviews()
    {
        // Animation View
        animationColor = UIColor.gray
    
        animationView = UIView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = UIColor.white
        self.addSubview(animationView)
        
        // Replicator
        dotLayer = CALayer()
        dotLayer.backgroundColor = animationColor.cgColor
        dotLayer.allowsEdgeAntialiasing = true
        dotLayer.opacity = initialOpacity
        
        replicatorLayer = CAReplicatorLayer()
        replicatorLayer.instanceCount = instanceCount;
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(2 * CGFloat.pi / CGFloat(instanceCount), 0, 0, 1)
        replicatorLayer.instanceDelay = duration / Double(instanceCount);
        replicatorLayer.addSublayer(self.dotLayer)
        
        animationView.layer.addSublayer(replicatorLayer)
        
        // opacityAnimation
        let opacityAnimation: CABasicAnimation = CABasicAnimation(keyPath:"opacity")
        opacityAnimation.fromValue = initialOpacity;
        opacityAnimation.toValue = 1;
        opacityAnimation.duration = replicatorLayer.instanceDelay * 1.5;
        opacityAnimation.autoreverses = true;
        
        // Animation Group
        animationGroup = CAAnimationGroup();
        animationGroup.animations = [opacityAnimation];
        animationGroup.repeatCount = Float.infinity;
        animationGroup.duration = duration;
        
        // Text Label
        textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = UIColor.white
        textLabel.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(textLabel)
        
        // Constraints
        let animationViewHeight: CGFloat = 80
        let animationViewWidth: CGFloat = animationViewHeight
        
        self.addConstraint(NSLayoutConstraint(item: animationView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: animationViewWidth))
        
        self.addConstraint(NSLayoutConstraint(item: animationView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: animationViewHeight))
        
        self.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: animationView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[animationView]-8-[textLabel]", options: .alignAllCenterX, metrics: nil, views: ["animationView": animationView, "textLabel": textLabel]))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        replicatorLayer.frame = self.animationView.bounds
        
        let size: CGFloat = min(self.animationView.bounds.size.width,self.animationView.bounds.size.height)
        let centerRadius: CGFloat = size / 4;
        
        let dotLayerHeight: CGFloat = size / 2  - centerRadius;
        let dotLayerWidth: CGFloat = size / 10;
        
        dotLayer.frame = CGRect(x: (self.animationView.bounds.size.width - dotLayerWidth) / 2,
                                y: (self.animationView.bounds.size.height - size) / 2,
                                width: dotLayerWidth,
                                height: dotLayerHeight)
        dotLayer.cornerRadius = dotLayerWidth / 2;
    }
}


// Mark: - Configure title
extension ContactListLoadingAnimationView {
    func configureTitle(title: String) -> Void {
        self.textLabel.text = title
    }
}

// Mark: - Animation
extension ContactListLoadingAnimationView {
    func startAnimation()
    {
        if animating {
            return
        }
        
        dotLayer.add(animationGroup, forKey: animationKeyPath)
        animating = true
    }
    
    func stopAnimation()
    {
        if !animating {
            return
        }
        
        dotLayer.removeAllAnimations()
        animating = false
    }
}
