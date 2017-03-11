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
        let star = UIBezierPath()
        star.move(to: CGPoint(x: 112.79, y: 119))
        star.addCurve(to: CGPoint(x: 107.75, y: 122.6), controlPoint1: CGPoint(x: 113.41, y: 122.8), controlPoint2: CGPoint(x: 111.14, y: 124.42))
        star.addLine(to: CGPoint(x: 96.53, y: 116.58))
        star.addCurve(to: CGPoint(x: 84.14, y: 116.47), controlPoint1: CGPoint(x: 93.14, y: 114.76), controlPoint2: CGPoint(x: 87.56, y: 114.71))
        star.addLine(to: CGPoint(x: 72.82, y: 122.3))
        star.addCurve(to: CGPoint(x: 67.84, y: 118.62), controlPoint1: CGPoint(x: 69.4, y: 124.06), controlPoint2: CGPoint(x: 67.15, y: 122.41))
        star.addLine(to: CGPoint(x: 70.1, y: 106.09))
        star.addCurve(to: CGPoint(x: 66.37, y: 94.27), controlPoint1: CGPoint(x: 70.78, y: 102.3), controlPoint2: CGPoint(x: 69.1, y: 96.98))
        star.addLine(to: CGPoint(x: 57.33, y: 85.31))
        star.addCurve(to: CGPoint(x: 59.29, y: 79.43), controlPoint1: CGPoint(x: 54.6, y: 82.6), controlPoint2: CGPoint(x: 55.48, y: 79.95))
        star.addLine(to: CGPoint(x: 71.91, y: 77.71))
        star.addCurve(to: CGPoint(x: 81.99, y: 70.51), controlPoint1: CGPoint(x: 75.72, y: 77.19), controlPoint2: CGPoint(x: 80.26, y: 73.95))
        star.addLine(to: CGPoint(x: 87.72, y: 59.14))
        star.addCurve(to: CGPoint(x: 93.92, y: 59.2), controlPoint1: CGPoint(x: 89.46, y: 55.71), controlPoint2: CGPoint(x: 92.25, y: 55.73))
        star.addLine(to: CGPoint(x: 99.46, y: 70.66))
        star.addCurve(to: CGPoint(x: 109.42, y: 78.03), controlPoint1: CGPoint(x: 101.13, y: 74.13), controlPoint2: CGPoint(x: 105.62, y: 77.44))
        star.addLine(to: CGPoint(x: 122, y: 79.96))
        star.addCurve(to: CGPoint(x: 123.87, y: 85.87), controlPoint1: CGPoint(x: 125.81, y: 80.55), controlPoint2: CGPoint(x: 126.64, y: 83.21))
        star.addLine(to: CGPoint(x: 114.67, y: 94.68))
        star.addCurve(to: CGPoint(x: 110.75, y: 106.43), controlPoint1: CGPoint(x: 111.89, y: 97.34), controlPoint2: CGPoint(x: 110.13, y: 102.63))
        star.addLine(to: CGPoint(x: 112.79, y: 119))
        return star.cgPath
    }
    
    static var swift: CGPath {
        let swiftPath = UIBezierPath()
        swiftPath.move(to: CGPoint(x: 376.2, y: 283.2))
        swiftPath.addCurve(to: CGPoint(x: 349.8, y: 238.4), controlPoint1: CGPoint(x: 367.4, y: 258.4), controlPoint2: CGPoint(x: 349.8, y: 238.4))
        swiftPath.addCurve(to: CGPoint(x: 236.5, y: 0), controlPoint1: CGPoint(x: 349.8, y: 238.4), controlPoint2: CGPoint(x: 399.7, y: 105.6))
        swiftPath.addCurve(to: CGPoint(x: 269, y: 180.8), controlPoint1: CGPoint(x: 303.7, y: 101.6), controlPoint2: CGPoint(x: 269, y: 180.8))
        swiftPath.addCurve(to: CGPoint(x: 181.29, y: 117.07), controlPoint1: CGPoint(x: 269, y: 180.8), controlPoint2: CGPoint(x: 211.4, y: 140.8))
        swiftPath.addCurve(to: CGPoint(x: 85, y: 33.6), controlPoint1: CGPoint(x: 151.18, y: 93.35), controlPoint2: CGPoint(x: 85, y: 33.6))
        swiftPath.addCurve(to: CGPoint(x: 145, y: 117.07), controlPoint1: CGPoint(x: 85, y: 33.6), controlPoint2: CGPoint(x: 128.15, y: 96.31))
        swiftPath.addCurve(to: CGPoint(x: 185.78, y: 163.66), controlPoint1: CGPoint(x: 161.85, y: 137.84), controlPoint2: CGPoint(x: 185.78, y: 163.66))
        swiftPath.addCurve(to: CGPoint(x: 136.36, y: 129.42), controlPoint1: CGPoint(x: 185.78, y: 163.66), controlPoint2: CGPoint(x: 161.07, y: 147.39))
        swiftPath.addCurve(to: CGPoint(x: 34.6, y: 50.4), controlPoint1: CGPoint(x: 111.65, y: 111.46), controlPoint2: CGPoint(x: 34.6, y: 50.4))
        swiftPath.addCurve(to: CGPoint(x: 133.8, y: 169.2), controlPoint1: CGPoint(x: 34.6, y: 50.4), controlPoint2: CGPoint(x: 82.69, y: 119.24))
        swiftPath.addCurve(to: CGPoint(x: 214.6, y: 244), controlPoint1: CGPoint(x: 184.91, y: 219.16), controlPoint2: CGPoint(x: 214.6, y: 244))
        swiftPath.addCurve(to: CGPoint(x: 129.8, y: 264.8), controlPoint1: CGPoint(x: 214.6, y: 244), controlPoint2: CGPoint(x: 196.2, y: 263.2))
        swiftPath.addCurve(to: CGPoint(x: 0, y: 221), controlPoint1: CGPoint(x: 63.4, y: 266.4), controlPoint2: CGPoint(x: 0, y: 221))
        swiftPath.addCurve(to: CGPoint(x: 206.6, y: 339.2), controlPoint1: CGPoint(x: 0, y: 221), controlPoint2: CGPoint(x: 62.5, y: 339.2))
        swiftPath.addCurve(to: CGPoint(x: 325, y: 304.8), controlPoint1: CGPoint(x: 270.6, y: 339.2), controlPoint2: CGPoint(x: 288.93, y: 304.8))
        swiftPath.addCurve(to: CGPoint(x: 383.3, y: 339.2), controlPoint1: CGPoint(x: 361.07, y: 304.8), controlPoint2: CGPoint(x: 381.7, y: 340))
        swiftPath.addCurve(to: CGPoint(x: 376.2, y: 283.2), controlPoint1: CGPoint(x: 384.9, y: 338.4), controlPoint2: CGPoint(x: 385, y: 308))
        return swiftPath.cgPath
    }
    
    static func circle(_ inFrame: CGRect) -> CGPath {
        let circle = UIBezierPath(ovalIn: inFrame)
        return circle.cgPath
    }
}
