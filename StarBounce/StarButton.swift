//
//  StatButton.swift
//  FavoriteStar
//
//  Created by Rafael Machado on 14/11/14.
//  Copyright (c) 2014 Rafael Machado. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class StarButton: UIButton, CAAnimationDelegate {

    fileprivate var starShape: CAShapeLayer!
    fileprivate var outerRingShape: CAShapeLayer!
    fileprivate var fillRingShape: CAShapeLayer!

    fileprivate let starKey = "FAVANIMKEY"
    fileprivate let favoriteKey = "FAVORITE"
    fileprivate let notFavoriteKey = "NOTFAVORITE"

    @IBInspectable
    var lineWidth: CGFloat = 1 {
        didSet {
            updateLayerProperties()
        }
    }

    @IBInspectable
    var favoriteColor: UIColor = UIColor(hex:"eecd34") {
        didSet {
            updateLayerProperties()
        }
    }

    @IBInspectable
    var notFavoriteColor: UIColor = UIColor(hex:"9e9b9b") {
        didSet {
            updateLayerProperties()
        }
    }

    @IBInspectable
    var starFavoriteColor: UIColor = UIColor(hex:"9e9b9b") {
        didSet {
            updateLayerProperties()
        }
    }

    var isFavorite: Bool = false {
        didSet {
            if self.isFavorite {
                favorite()
            } else {
                notFavorite()
            }
        }
    }

    fileprivate func updateLayerProperties() {
        if fillRingShape != nil {
            fillRingShape.fillColor = favoriteColor.cgColor
        }

        if outerRingShape != nil {
            outerRingShape.lineWidth = lineWidth
            outerRingShape.strokeColor = notFavoriteColor.cgColor
        }

        if starShape != nil {
            if isFavorite {
                starShape.fillColor = starFavoriteColor.cgColor
            } else {
                starShape.fillColor = notFavoriteColor.cgColor
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createLayersIfNeeded()
        updateLayerProperties()
    }

    fileprivate func createLayersIfNeeded() {
        if fillRingShape == nil {
            fillRingShape = CAShapeLayer()
            fillRingShape.path = Paths.circle(frameWithInset())
            fillRingShape.bounds = (fillRingShape.path?.boundingBox)!
            fillRingShape.fillColor = favoriteColor.cgColor
            fillRingShape.lineWidth = lineWidth
            fillRingShape.position = CGPoint(x: fillRingShape.bounds.width/2, y: fillRingShape.bounds.height/2)
            fillRingShape.transform = CATransform3DMakeScale(0.2, 0.2, 0.2)
            fillRingShape.opacity = 0
            self.layer.addSublayer(fillRingShape)
        }
        if outerRingShape == nil {
            outerRingShape = CAShapeLayer()
            outerRingShape.path = Paths.circle(frameWithInset())
            outerRingShape.bounds = frameWithInset()
            outerRingShape.lineWidth = lineWidth
            outerRingShape.strokeColor = notFavoriteColor.cgColor
            outerRingShape.fillColor = UIColor.clear.cgColor
            outerRingShape.position = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
            outerRingShape.transform = CATransform3DIdentity
            outerRingShape.opacity = 0.5
            self.layer.addSublayer(outerRingShape)
        }
        if starShape == nil {
            var starFrame = self.bounds
            starFrame.size.width = starFrame.width/2.5
            starFrame.size.height = starFrame.height/2.5

            starShape = CAShapeLayer()
            starShape.path = CGPath.rescaleForFrame(path: Paths.star, frame: starFrame)
            starShape.bounds = (starShape.path?.boundingBoxOfPath)!
            starShape.fillColor = notFavoriteColor.cgColor
            starShape.position = CGPoint(x: (outerRingShape.path?.boundingBox.width)!/2,
                                         y: (outerRingShape.path?.boundingBox.height)!/2)
            starShape.transform = CATransform3DIdentity
            starShape.opacity = 0.5
            self.layer.addSublayer(starShape)
        }
    }

    fileprivate func frameWithInset() -> CGRect {
        return self.bounds.insetBy(dx: lineWidth/2, dy: lineWidth/2)
    }

    fileprivate func notFavorite() {
        let starFillColor = CABasicAnimation(keyPath: "fillColor")
        starFillColor.toValue = notFavoriteColor.cgColor
        starFillColor.duration = 0.3

        let starOpacity = CABasicAnimation(keyPath: "opacity")
        starOpacity.toValue = 0.5
        starOpacity.duration = 0.3

        let starGroup = CAAnimationGroup()
        starGroup.animations = [starFillColor, starOpacity]

        starShape.add(starGroup, forKey: nil)
        starShape.fillColor = notFavoriteColor.cgColor
        starShape.opacity = 0.5

        let fillCircle = CABasicAnimation(keyPath: "opacity")
        fillCircle.toValue = 0
        fillCircle.duration = 0.3
        fillCircle.setValue(notFavoriteKey, forKey: starKey)
        fillCircle.delegate = self

        fillRingShape.add(fillCircle, forKey: nil)
        fillRingShape.opacity = 0

        let outerCircle = CABasicAnimation(keyPath: "opacity")
        outerCircle.toValue = 0.5
        outerCircle.duration = 0.3

        outerRingShape.add(outerCircle, forKey: nil)
        outerRingShape.opacity = 0.5

    }

    fileprivate func favorite() {
        var starGoUp = CATransform3DIdentity
        starGoUp = CATransform3DScale(starGoUp, 1.5, 1.5, 1.5)
        var starGoDown = CATransform3DIdentity
        starGoDown = CATransform3DScale(starGoDown, 0.01, 0.01, 0.01)

        let starKeyFrames = CAKeyframeAnimation(keyPath: "transform")
        starKeyFrames.values = [NSValue(caTransform3D:CATransform3DIdentity),
                                NSValue(caTransform3D:starGoUp),
                                NSValue(caTransform3D:starGoDown)]
        starKeyFrames.keyTimes = [0.0, 0.4, 0.6]
        starKeyFrames.duration = 0.4
        starKeyFrames.beginTime = CACurrentMediaTime() + 0.05
        starKeyFrames.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        starKeyFrames.fillMode =  kCAFillModeBackwards
        starKeyFrames.setValue(favoriteKey, forKey: starKey)
        starKeyFrames.delegate = self

        starShape.add(starKeyFrames, forKey: favoriteKey)
        starShape.transform = starGoDown

        var grayGoUp = CATransform3DIdentity
        grayGoUp = CATransform3DScale(grayGoUp, 1.5, 1.5, 1.5)
        var grayGoDown = CATransform3DIdentity
        grayGoDown = CATransform3DScale(grayGoDown, 0.01, 0.01, 0.01)

        let outerCircleAnimation = CAKeyframeAnimation(keyPath: "transform")
        outerCircleAnimation.values = [NSValue(caTransform3D:CATransform3DIdentity),
                                       NSValue(caTransform3D:grayGoUp),
                                       NSValue(caTransform3D:grayGoDown)]
        outerCircleAnimation.keyTimes = [0.0, 0.4, 0.6]
        outerCircleAnimation.duration = 0.4
        outerCircleAnimation.beginTime = CACurrentMediaTime() + 0.01
        outerCircleAnimation.fillMode =  kCAFillModeBackwards
        outerCircleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)

        outerRingShape.add(outerCircleAnimation, forKey: "Gray circle Animation")
        outerRingShape.transform = grayGoDown

        var favoriteFillGrow = CATransform3DIdentity
        favoriteFillGrow = CATransform3DScale(favoriteFillGrow, 1.5, 1.5, 1.5)
        let fillCircleAnimation = CAKeyframeAnimation(keyPath: "transform")
        fillCircleAnimation.values = [NSValue(caTransform3D:fillRingShape.transform),
                                      NSValue(caTransform3D:favoriteFillGrow),
                                      NSValue(caTransform3D:CATransform3DIdentity)]
        fillCircleAnimation.keyTimes = [0.0, 0.4, 0.6]
        fillCircleAnimation.duration = 0.4
        fillCircleAnimation.beginTime = CACurrentMediaTime() + 0.22
        fillCircleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        fillCircleAnimation.fillMode =  kCAFillModeBackwards

        let favoriteFillOpacity = CABasicAnimation(keyPath: "opacity")
        favoriteFillOpacity.toValue = 1
        favoriteFillOpacity.duration = 1
        favoriteFillOpacity.beginTime = CACurrentMediaTime()
        favoriteFillOpacity.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        favoriteFillOpacity.fillMode =  kCAFillModeBackwards

        fillRingShape.add(favoriteFillOpacity, forKey: "Show fill circle")
        fillRingShape.add(fillCircleAnimation, forKey: "fill circle Animation")
        fillRingShape.transform = CATransform3DIdentity
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let key = anim.value(forKey: starKey) as? String {
            switch key  {
            case favoriteKey:
                endFavorite()
            case notFavoriteKey:
                prepareForFavorite()
            default:
                break
            }
        }
        enableTouch()
    }

    fileprivate func endFavorite() {

        executeWithoutActions {
            self.starShape.fillColor = self.starFavoriteColor.cgColor
            self.starShape.opacity = 1
            self.fillRingShape.opacity = 1
            self.outerRingShape.transform = CATransform3DIdentity
            self.outerRingShape.opacity = 0
        }

        var starGoUp = CATransform3DIdentity
        starGoUp = CATransform3DScale(starGoUp, 2, 2, 2)

        let starKeyFrames = CAKeyframeAnimation(keyPath: "transform")
        starKeyFrames.values = [NSValue(caTransform3D: starShape.transform),
                                NSValue(caTransform3D:starGoUp),
                                NSValue(caTransform3D:CATransform3DIdentity)]
        starKeyFrames.keyTimes = [0.0, 0.4, 0.6]
        starKeyFrames.duration = 0.2
        starKeyFrames.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        starShape.add(starKeyFrames, forKey: nil)
        starShape.transform = CATransform3DIdentity
    }

    fileprivate func prepareForFavorite() {
        executeWithoutActions {
            self.fillRingShape.opacity = 0
            self.fillRingShape.transform = CATransform3DMakeScale(0.2, 0.2, 0.2)
        }
    }

    fileprivate func executeWithoutActions(_ closure: () -> Void) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        closure()
        CATransaction.commit()
    }

    func animationDidStart(_ anim: CAAnimation) {
        disableTouch()
    }

    fileprivate func disableTouch() {
        self.isUserInteractionEnabled = false
    }

    fileprivate func enableTouch() {
        self.isUserInteractionEnabled = true
    }
}
