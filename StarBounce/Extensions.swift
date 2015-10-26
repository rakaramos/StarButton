//
//  Extensions.swift
//  FavoriteStart
//
//  Created by Rafael Machado on 2/9/15.
//  Copyright (c) 2015 Rafael Machado. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init (hex:String) {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            self.init()
            return
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

extension CALayer {
    func applyAnimation(animation: CABasicAnimation) {
        guard let copy = animation.copy() as? CABasicAnimation,
        let presentationLayer = self.presentationLayer(),
        let keyPath = copy.keyPath else {
                return
        }
        
        if copy.fromValue == nil {
            copy.fromValue = presentationLayer.valueForKeyPath(keyPath)
        }
        self.addAnimation(copy, forKey: copy.keyPath)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.setValue(copy.toValue, forKeyPath:keyPath)
        CATransaction.commit()
    }
}

extension CGPath {
    class func rescaleForFrame(path path: CGPath, frame: CGRect) -> CGPath{
        let boundingBox = CGPathGetBoundingBox(path)
        let boundingBoxAspectRatio = CGRectGetWidth(boundingBox)/CGRectGetHeight(boundingBox)
        let viewAspectRatio = CGRectGetWidth(frame)/CGRectGetHeight(frame)
        
        var scaleFactor: CGFloat = 1
        if (boundingBoxAspectRatio > viewAspectRatio) {
            scaleFactor = CGRectGetWidth(frame)/CGRectGetWidth(boundingBox)
        } else {
            scaleFactor = CGRectGetHeight(frame)/CGRectGetHeight(boundingBox)
        }
        
        var scaleTransform = CGAffineTransformIdentity
        scaleTransform = CGAffineTransformScale(scaleTransform, scaleFactor, scaleFactor)
        scaleTransform = CGAffineTransformTranslate(scaleTransform, -CGRectGetMinX(boundingBox), -CGRectGetMinY(boundingBox))
        let scaledSize = CGSizeApplyAffineTransform(boundingBox.size, CGAffineTransformMakeScale(scaleFactor, scaleFactor))
        let centerOffset = CGSizeMake((CGRectGetWidth(frame)-scaledSize.width)/(scaleFactor*2.0), (CGRectGetHeight(frame)-scaledSize.height)/(scaleFactor*2.0))
        scaleTransform = CGAffineTransformTranslate(scaleTransform, centerOffset.width, centerOffset.height)
        
        if let scaleTransform = CGPathCreateCopyByTransformingPath(path, &scaleTransform) {
            return scaleTransform
        } else {
            return path
        }
    }
}