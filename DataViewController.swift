//
//  DataViewController.swift
//  IBDesignable_Example
//
//  Created by Burcu Geneci on 19/09/16.
//  Copyright © 2016 Burcu Geneci. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }
//
//     public var stepCount : Int = 6
//     public var activeStep : Int = 1
//    
//     public var stepNodeSize : CGSize = CGSizeMake(16, 16)
//     public var stepLineSize : CGSize = CGSizeMake(26, 2)
//    //    @IBInspectable public var activeStepImage : UIImage? =  UIImage.init(named:"bgProgressActive")
//    //    @IBInspectable public var passiveStepImage : UIImage? = UIImage.init(named:"bgProgressPassive")
//    //    @IBInspectable public var progressLineImage : UIImage? = UIImage.init(named:"bgProgressLine")
//    //
//    
//     public var activeStepImage : UIImage? =  UIImage.fromColor(UIColor.orangeColor())
//     public var passiveStepImage : UIImage? = UIImage.fromColor(UIColor.blueColor())
//     public var progressLineImage : UIImage? = UIImage.fromColor(UIColor.grayColor())
//
//
//    func getActiveImageViews()-> [UIImageView]{
//        var stepNodes : [UIImageView] =  []
//        for _ in 0 ..< self.stepCount{
//            let node = UIImageView(image:self.activeStepImage)
//            node.frame = CGRect(origin: CGPoint(x: 0,y: 0), size: stepNodeSize)
//            node.translatesAutoresizingMaskIntoConstraints = false
//            
//            stepNodes.append(node)
//        }
//        return stepNodes
//    }
//    
//    func getPassiveImageView()-> UIImageView{
//        return UIImageView(image:self.passiveStepImage)
//    }
//    
//    func getProgressLineViews()-> [UIImageView]{
//        var stepLines : [UIImageView] =  []
//        for _ in 0 ..< self.stepCount-1{
//            let line = UIImageView(image:self.progressLineImage)
//            line.frame = CGRect(origin: CGPoint(x: 0 ,y: 0), size: stepLineSize)
//            line.translatesAutoresizingMaskIntoConstraints = false
//            stepLines.append(line)
//        }
//        return stepLines
//    }
//    
//    func updateStepNum(){
//        //        if(step < self.activeStep){
//        //            currentImageView = self.getActiveImageView()
//        //        }
//    }
//    func setupView(){
//        self.view.translatesAutoresizingMaskIntoConstraints = false
//        var progressNodes : [UIImageView] =  self.getActiveImageViews()
//        var progressLines : [UIImageView] =  self.getProgressLineViews()
//        self.addHeightConstraintForSuperView(self.view)
//        
//        for step in 0 ..< self.stepCount{
//            let currentImageView = progressNodes[step]
//            self.view.addSubview(currentImageView)
//            
//            if(step < self.stepCount - 1 ){
//                let progressLine = progressLines[step]
//                self.view.addSubview(progressLine)
//                
//                if(step == 0){
//                    self.addLeftConstraintToSuperView(self.view, subView: currentImageView)
//                }else{
//                    let previewProgressLine = progressLines[step-1]
//                    self.addLeftConstraintTwoViews(self.view, leftView: previewProgressLine, rigthView: currentImageView)
//                }
//                
//                self.addWidthHeightConstraintToSubView(currentImageView, size: self.stepNodeSize)
//                self.addCenterHorizontallyConstraintViews(self.view, subView: currentImageView)
//
//                self.addLeftConstraintTwoViews(self.view, leftView:currentImageView , rigthView: progressLine)
//                self.addWidthHeightConstraintToSubView(progressLine, size: self.stepLineSize)
//                self.addCenterHorizontallyConstraintViews(self.view, subView: progressLine)
//                
//            }else{
//                
//                let previewProgressLine = progressLines[step-1]
//                self.addLeftConstraintTwoViews(self.view, leftView: previewProgressLine, rigthView: currentImageView)
//                self.addCenterHorizontallyConstraintViews(self.view, subView: currentImageView)
//
//                self.addWidthHeightConstraintToSubView(currentImageView, size: self.stepNodeSize)
//                self.addRightConstraintToSuperView(self.view, subView: currentImageView)
//            }
//        }
////        self.setNeedsDisplay()
//    }
//    
//    private func addHeightConstraintForSuperView(superView : UIView){
//        
//        superView.addConstraint(NSLayoutConstraint(item: superView,
//            attribute: .Height,
//            relatedBy: .Equal,
//            toItem: nil,
//            attribute: .NotAnAttribute,
//            multiplier: 1,
//            constant: self.stepNodeSize.height))
//        
//    }
//    
//    private func addLeftConstraintToSuperView(superView : UIView, subView : UIView){
//        
//        superView.addConstraint(NSLayoutConstraint(item: subView,
//            attribute: .Leading,
//            relatedBy: .Equal,
//            toItem: superView,
//            attribute: .Leading,
//            multiplier: 1,
//            constant: 0))
//    }
//    
//    private func addRightConstraintToSuperView(superView : UIView, subView : UIView){
//        
//        superView.addConstraint(NSLayoutConstraint(item: subView,
//            attribute: .Trailing,
//            relatedBy: .Equal,
//            toItem: superView,
//            attribute: .Trailing,
//            multiplier: 1,
//            constant: 0))
//    }
//    
//    private func addLeftConstraintTwoViews(superView : UIView , leftView : UIView, rigthView : UIView){
//        
//        superView.addConstraint(NSLayoutConstraint(item: leftView,
//            attribute: .Trailing,
//            relatedBy: .Equal,
//            toItem: rigthView,
//            attribute: .Leading,
//            multiplier: 1,
//            constant: 0))
//    }
//    private func addCenterHorizontallyConstraintViews(superView : UIView , subView : UIView){
//        
//        superView.addConstraint(NSLayoutConstraint(item: subView,
//            attribute: .CenterY,
//            relatedBy: .Equal,
//            toItem: superView,
//            attribute: .CenterY,
//            multiplier: 1,
//            constant: 0))
//    }
//    
//    
//    func addWidthHeightConstraintToSubView(subView : UIView, size : CGSize){
//        
//        subView.addConstraint(NSLayoutConstraint(item: subView,
//            attribute: .Width,
//            relatedBy: .Equal,
//            toItem: nil,
//            attribute: .NotAnAttribute,
//            multiplier: 1,
//            constant: size.width))
//        
//        subView.addConstraint(NSLayoutConstraint(item: subView,
//            attribute: .Height,
//            relatedBy: .Equal,
//            toItem: nil,
//            attribute: .NotAnAttribute,
//            multiplier: 1,
//            constant: size.height))
//    }
    
}

extension UIImage {
    
    static func fromColor(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
