//
//  Extensions.swift
//  FavoriteStart
//
//  Created by Rafael Machado on 2/9/15.
//  Copyright (c) 2015 Rafael Machado. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init (hex: String) {
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }

        if cString.characters.count != 6 {
            self.init()
            return
        }

        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

extension CALayer {
    func applyAnimation(_ animation: CABasicAnimation) {
        guard let copy = animation.copy() as? CABasicAnimation,
        let presentationLayer = self.presentation(),
        let keyPath = copy.keyPath else {
                return
        }

        if copy.fromValue == nil {
            copy.fromValue = presentationLayer.value(forKeyPath: keyPath)
        }
        self.add(copy, forKey: copy.keyPath)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.setValue(copy.toValue, forKeyPath:keyPath)
        CATransaction.commit()
    }
}

extension CGPath {
    class func rescaleForFrame(path: CGPath, frame: CGRect) -> CGPath {
        let boundingBox = path.boundingBoxOfPath
        let boundingBoxAspectRatio = boundingBox.width/boundingBox.height
        let viewAspectRatio = frame.width/frame.height

        var scaleFactor: CGFloat = 1
        if boundingBoxAspectRatio > viewAspectRatio {
            scaleFactor = frame.width/boundingBox.width
        } else {
            scaleFactor = frame.height/boundingBox.height
        }

        var scaleTransform = CGAffineTransform.identity
        scaleTransform = scaleTransform.scaledBy(x: scaleFactor, y: scaleFactor)
        scaleTransform = scaleTransform.translatedBy(x: -boundingBox.minX, y: -boundingBox.minY)
        let scaledSize = boundingBox.size.applying(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        let centerOffset = CGSize(width: (frame.width - scaledSize.width) / (scaleFactor * 2.0),
                                  height: (frame.height - scaledSize.height) / (scaleFactor * 2.0))
        scaleTransform = scaleTransform.translatedBy(x: centerOffset.width, y: centerOffset.height)

        if let scaleTransform = path.copy(using: &scaleTransform) {
            return scaleTransform
        } else {
            return path
        }
    }
}
