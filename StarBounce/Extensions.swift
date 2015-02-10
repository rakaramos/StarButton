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
        
        if (countElements(cString) != 6) {
            self.init()
            return
        }
        
        var rString = (cString as NSString).substringToIndex(2)
        var gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        var bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

import UIKit

extension CALayer {
    func applyAnimation(animation: CABasicAnimation) {
        let copy = animation.copy() as CABasicAnimation
        if copy.fromValue == nil {
            copy.fromValue = self.presentationLayer().valueForKeyPath(copy.keyPath)
        }
        self.addAnimation(copy, forKey: copy.keyPath)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.setValue(copy.toValue, forKeyPath:copy.keyPath)
        CATransaction.commit()
    }
}

extension CGPath {
    class func rescaleForFrame(#path: CGPath, frame: CGRect) -> CGPath{
        let boundingBox = CGPathGetBoundingBox(path);
        let boundingBoxAspectRatio = CGRectGetWidth(boundingBox)/CGRectGetHeight(boundingBox);
        let viewAspectRatio = CGRectGetWidth(frame)/CGRectGetHeight(frame);
        
        var scaleFactor: CGFloat = 1.0;
        if (boundingBoxAspectRatio > viewAspectRatio) {
            scaleFactor = CGRectGetWidth(frame)/CGRectGetWidth(boundingBox);
        } else {
            scaleFactor = CGRectGetHeight(frame)/CGRectGetHeight(boundingBox);
        }
        
        var scaleTransform = CGAffineTransformIdentity;
        scaleTransform = CGAffineTransformScale(scaleTransform, scaleFactor, scaleFactor);
        scaleTransform = CGAffineTransformTranslate(scaleTransform, -CGRectGetMinX(boundingBox), -CGRectGetMinY(boundingBox));
        let scaledSize = CGSizeApplyAffineTransform(boundingBox.size, CGAffineTransformMakeScale(scaleFactor, scaleFactor));
        let centerOffset = CGSizeMake((CGRectGetWidth(frame)-scaledSize.width)/(scaleFactor*2.0), (CGRectGetHeight(frame)-scaledSize.height)/(scaleFactor*2.0));
        scaleTransform = CGAffineTransformTranslate(scaleTransform, centerOffset.width, centerOffset.height);
        return CGPathCreateCopyByTransformingPath(path, &scaleTransform);
    }
}