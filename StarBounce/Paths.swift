//
//  Paths.swift
//  FavoriteStart
//
//  Created by Rafael Machado on 2/9/15.
//  Copyright (c) 2015 Rafael Machado. All rights reserved.
//

import UIKit

struct Paths {
   
    static var star: CGPath {
        var star = UIBezierPath()
        star.moveToPoint(CGPointMake(112.79, 119))
        star.addCurveToPoint(CGPointMake(107.75, 122.6), controlPoint1: CGPointMake(113.41, 122.8), controlPoint2: CGPointMake(111.14, 124.42))
        star.addLineToPoint(CGPointMake(96.53, 116.58))
        star.addCurveToPoint(CGPointMake(84.14, 116.47), controlPoint1: CGPointMake(93.14, 114.76), controlPoint2: CGPointMake(87.56, 114.71))
        star.addLineToPoint(CGPointMake(72.82, 122.3))
        star.addCurveToPoint(CGPointMake(67.84, 118.62), controlPoint1: CGPointMake(69.4, 124.06), controlPoint2: CGPointMake(67.15, 122.41))
        star.addLineToPoint(CGPointMake(70.1, 106.09))
        star.addCurveToPoint(CGPointMake(66.37, 94.27), controlPoint1: CGPointMake(70.78, 102.3), controlPoint2: CGPointMake(69.1, 96.98))
        star.addLineToPoint(CGPointMake(57.33, 85.31))
        star.addCurveToPoint(CGPointMake(59.29, 79.43), controlPoint1: CGPointMake(54.6, 82.6), controlPoint2: CGPointMake(55.48, 79.95))
        star.addLineToPoint(CGPointMake(71.91, 77.71))
        star.addCurveToPoint(CGPointMake(81.99, 70.51), controlPoint1: CGPointMake(75.72, 77.19), controlPoint2: CGPointMake(80.26, 73.95))
        star.addLineToPoint(CGPointMake(87.72, 59.14))
        star.addCurveToPoint(CGPointMake(93.92, 59.2), controlPoint1: CGPointMake(89.46, 55.71), controlPoint2: CGPointMake(92.25, 55.73))
        star.addLineToPoint(CGPointMake(99.46, 70.66))
        star.addCurveToPoint(CGPointMake(109.42, 78.03), controlPoint1: CGPointMake(101.13, 74.13), controlPoint2: CGPointMake(105.62, 77.44))
        star.addLineToPoint(CGPointMake(122, 79.96))
        star.addCurveToPoint(CGPointMake(123.87, 85.87), controlPoint1: CGPointMake(125.81, 80.55), controlPoint2: CGPointMake(126.64, 83.21))
        star.addLineToPoint(CGPointMake(114.67, 94.68))
        star.addCurveToPoint(CGPointMake(110.75, 106.43), controlPoint1: CGPointMake(111.89, 97.34), controlPoint2: CGPointMake(110.13, 102.63))
        star.addLineToPoint(CGPointMake(112.79, 119))
        return star.CGPath
    }
    
    static func circle(inFrame: CGRect) -> CGPath {
        let circle = UIBezierPath(ovalInRect: inFrame)
        return circle.CGPath
    }
}
