//
//  ProgressStepControl.swift
//  IBDesignable_Example
//
//  Created by Burcu Geneci on 19/09/16.
//  Copyright © 2016 Burcu Geneci. All rights reserved.
//

import Foundation

import UIKit
@IBDesignable
public class ProgressStepControl: UIView {
    
    var stepNodes : [UIImageView] =  []
    var stepLines : [UIImageView] =  []
    
    @IBInspectable public var stepCount : Int = 5{
        didSet{
            self.setupView()
            self.calculatedWeight()
        }
    }
    @IBInspectable public var activeStep : Int = 1{
        didSet{
            self.setupView()
            self.updateStepNum()
        }
    }
    
    @IBInspectable public var stepNodeSize : CGSize = CGSizeMake(16, 16){
        didSet{
            self.setupView()
        }
    }
    @IBInspectable public var stepLineSize : CGSize = CGSizeMake(26, 2){
        didSet{
            self.setupView()
        }
    }
    
    @IBInspectable public var activeStepImage : UIImage? =  UIImage.fromColor(UIColor.orangeColor())
    @IBInspectable public var passiveStepImage : UIImage? = UIImage.fromColor(UIColor.blueColor())
    @IBInspectable public var progressLineImage : UIImage? = UIImage.fromColor(UIColor.grayColor())
    
    func calculatedHeight()->CGFloat{
        return self.stepNodeSize.height
    }
    
    func calculatedWeight()->CGFloat{
        let weight =  CGFloat(self.stepCount) * self.stepNodeSize.width + CGFloat(self.stepCount - 1) * self.stepLineSize.width
        return weight
    }
    
    override public func intrinsicContentSize() -> CGSize {
        return CGSize(width: self.calculatedWeight(), height: self.stepNodeSize.height)
    }
    
    override public class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    func getPassiveImageViews()-> [UIImageView]{
        for _ in 0 ..< self.stepCount{
            let node = UIImageView(image:self.passiveStepImage)
            node.frame = CGRect(origin: CGPoint(x: 0,y: 0), size: stepNodeSize)
            node.translatesAutoresizingMaskIntoConstraints = false
            
            self.stepNodes.append(node)
        }
        return self.stepNodes
    }
    
    func getProgressLineViews()-> [UIImageView]{
        for _ in 0 ..< self.stepCount-1{
            let line = UIImageView(image:self.progressLineImage)
            line.frame = CGRect(origin: CGPoint(x: 0 ,y: 0), size: stepLineSize)
            line.translatesAutoresizingMaskIntoConstraints = false
            self.stepLines.append(line)
        }
        return self.stepLines
    }
    
    func updateStepNum(){
        for step in 0 ..< self.stepCount{
            if(step < self.activeStep){
                self.stepNodes[step].image = self.activeStepImage
            }else{
                self.stepNodes[step].image = self.passiveStepImage
            }
        }
    }
    func setupView(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setContentHuggingPriority(1000, forAxis: .Horizontal)
        self.setContentHuggingPriority(1000, forAxis: .Vertical)
        var progressNodes : [UIImageView] =  self.getPassiveImageViews()
        var progressLines : [UIImageView] =  self.getProgressLineViews()
        
        for step in 0 ..< self.stepCount{
            let currentImageView = progressNodes[step]
            self.addSubview(currentImageView)
            
            if(step < self.stepCount - 1 ){
                let progressLine = progressLines[step]
                self.addSubview(progressLine)
                
                if(step == 0){
                    self.addLeftConstraintToSuperView(self, subView: currentImageView)
                }else{
                    let previewProgressLine = progressLines[step-1]
                    self.addLeftConstraintTwoViews(self, leftView: previewProgressLine, rigthView: currentImageView)
                }
                
                self.addWidthHeightConstraintToSubView(currentImageView, size: self.stepNodeSize)
                self.addCenterHorizontallyConstraintViews(self, subView: currentImageView)
                
                self.addLeftConstraintTwoViews(self, leftView:currentImageView , rigthView: progressLine)
                self.addWidthHeightConstraintToSubView(progressLine, size: self.stepLineSize)
                self.addCenterHorizontallyConstraintViews(self, subView: progressLine)
                
            }else{
                
                let previewProgressLine = progressLines[step-1]
                self.addLeftConstraintTwoViews(self, leftView: previewProgressLine, rigthView: currentImageView)
                self.addCenterHorizontallyConstraintViews(self, subView: currentImageView)
                
                self.addWidthHeightConstraintToSubView(currentImageView, size: self.stepNodeSize)
                self.addRightConstraintToSuperView(self, subView: currentImageView)
            }
        }
        self.setNeedsDisplay()
    }
    
}

extension ProgressStepControl{
    private func addLeftConstraintToSuperView(superView : UIView, subView : UIView){
        
        superView.addConstraint(NSLayoutConstraint(item: subView,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: superView,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
    }
    
    private func addRightConstraintToSuperView(superView : UIView, subView : UIView){
        
        superView.addConstraint(NSLayoutConstraint(item: subView,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: superView,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0))
    }
    
    private func addLeftConstraintTwoViews(superView : UIView , leftView : UIView, rigthView : UIView){
        
        superView.addConstraint(NSLayoutConstraint(item: leftView,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: rigthView,
            attribute: .Leading,
            multiplier: 1,
            constant: 0))
    }
    private func addCenterHorizontallyConstraintViews(superView : UIView , subView : UIView){
        
        superView.addConstraint(NSLayoutConstraint(item: subView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: superView,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0))
    }
    
    
    func addWidthHeightConstraintToSubView(subView : UIView, size : CGSize){
        
        subView.addConstraint(NSLayoutConstraint(item: subView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: size.width))
        
        subView.addConstraint(NSLayoutConstraint(item: subView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: size.height))
    }
}

