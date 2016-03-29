//
//  ColorHSPickerView.swift
//  ColorPicker
//
//  Created by PC on 3/26/16.
//  Copyright © 2016 Randel Smith. All rights reserved.
//

import UIKit

public class ColorHSPickerView: UIControl {
    
    static let kThumbViewEdgePadding : CGFloat = 20
    static let kContentViewEdgePadding : CGFloat = 16
    
    var thumbView : UIControl
    var contentView : UIView
    var colorMapImageView : UIImageView
    
    private var currentColor : UIColor!
    public var color : UIColor! {
        get{
            if let c = self.currentColor {
                return c
            }
        return nil
            
        }

        set(newColor){
            
            if let color = newColor {
                var h : CGFloat = 0
                var s : CGFloat = 0
                
                color.getHue(&h, saturation: &s, brightness: nil, alpha: nil)
                
                self.currentColor = UIColor(hue: h, saturation: s, brightness: 1, alpha: 1)
                self.thumbView.backgroundColor = self.currentColor!
                
                self.thumbView.center = self.pointWithPadding(self.pointFromColor(color), padding: ColorHSPickerView.kThumbViewEdgePadding)
            }
            
        }
    }
    
    init (){
        self.thumbView = ColorHSPickerView.initThumbViewControl()
        self.contentView = ColorHSPickerView.initContentView()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let image = UIImage(named: "colormap", inBundle: bundle, compatibleWithTraitCollection: nil)
        self.colorMapImageView = ColorHSPickerView.initColorMapImageView(image!)
        
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.addViewComponentsToSubview()
        
        self.configContentViewWithFrame(self.frame)
        
    }
    
    public override init(frame: CGRect) {
        
        self.thumbView = ColorHSPickerView.initThumbViewControl()
        self.contentView = ColorHSPickerView.initContentView()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let image = UIImage(named: "colormap", inBundle: bundle, compatibleWithTraitCollection: nil)
        self.colorMapImageView = ColorHSPickerView.initColorMapImageView(image!)
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.addViewComponentsToSubview()
        
        self.configContentViewWithFrame(self.frame)


    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.thumbView = ColorHSPickerView.initThumbViewControl()
        self.contentView = ColorHSPickerView.initContentView()
        
        let bundle = NSBundle(forClass: self.dynamicType)
        var image = UIImage(named: "colormap", inBundle: bundle, compatibleWithTraitCollection: nil)
        image = UIImage(named: "colormap")
        self.colorMapImageView = ColorHSPickerView.initColorMapImageView(image!)
        
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.addViewComponentsToSubview()
        
        self.configContentViewWithFrame(self.frame)
        
        
    }
    
    func configContentViewWithFrame(frame: CGRect){
        self.contentView.frame = CGRect(x: 8, y: 8, width: frame.width - ColorHSPickerView.kContentViewEdgePadding, height: frame.height - ColorHSPickerView.kContentViewEdgePadding)
        
        self.colorMapImageView.frame = CGRect(x: 0, y: 0, width: self.colorMapImageView.superview!.frame.width, height: self.colorMapImageView.superview!.frame.height)
    }
    
    func addViewComponentsToSubview(){
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.colorMapImageView)
        self.addSubview(self.thumbView)
    }
    
    class func initThumbViewControl() -> ThumbViewControl {
        let thumbView = ThumbViewControl(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        thumbView.backgroundColor = UIColor.blackColor()
        thumbView.layer.cornerRadius = thumbView.frame.width / 2
        thumbView.layer.borderColor = UIColor(white: 0.9, alpha: 0.8).CGColor
        thumbView.layer.borderWidth = 2
        thumbView.layer.shadowColor = UIColor.blackColor().CGColor
        thumbView.layer.shadowOffset = CGSizeZero;
        thumbView.layer.shadowRadius = 1;
        thumbView.layer.shadowOpacity = 0.5;
        
        return thumbView
    }
    
    class func initContentView() -> UIView {
        let contentView = UIView.init()
        contentView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        contentView.userInteractionEnabled = false
        contentView.layer.cornerRadius = 15
        contentView.layer.borderColor = UIColor(white: 0.9, alpha: 0.8).CGColor
        contentView.layer.borderWidth = 2
        contentView.layer.shadowColor = UIColor.blackColor().CGColor
        contentView.layer.shadowOffset = CGSizeZero;
        contentView.layer.shadowRadius = 1;
        contentView.layer.shadowOpacity = 0.5;
        
        return contentView
    }
    
    class func initColorMapImageView(image: UIImage) -> UIImageView {
        
        let colorMapImageView = UIImageView(image: image)
        colorMapImageView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        colorMapImageView.layer.cornerRadius = 15;
        colorMapImageView.layer.masksToBounds = true
        
        return colorMapImageView
    }
    
    public override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        super.beginTrackingWithTouch(touch, withEvent: event)
        
        self.updateWithTouch(touch)
        
        return true
    }
    
    public override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        super.continueTrackingWithTouch(touch, withEvent: event)
        
        self.updateWithTouch(touch)
        
        self.sendActionsForControlEvents(.ValueChanged)
        
        return true
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        super.endTrackingWithTouch(touch, withEvent: event)
        
        if let newTouch = touch {
            self.updateWithTouch(newTouch)
            
            if CGRectContainsPoint(self.bounds, newTouch.locationInView(self)){
                self.sendActionsForControlEvents(.TouchUpInside)
            }
        }
        
    }
    
    private func pointWithPadding(point: CGPoint, padding: CGFloat) -> CGPoint {
        var x : CGFloat = point.x
        if point.x < padding {
            x = padding
        } else if point.x > self.frame.size.width - padding {
            x = self.frame.size.width - padding
        }
        
        var y : CGFloat = point.y
        if point.y < padding {
            y = padding
        } else if point.y > self.frame.size.height - padding{
            y = self.frame.size.height - padding
        }
        
        return CGPoint(x: x, y: y)
    }
    
    private func colorFromPoint(point: CGPoint) -> UIColor{
        
        
        var hue = point.x/self.frame.size.width
        if hue <= 0 {
            hue = 0.00001
        }
        
        var sat = 1 - point.y/self.frame.size.height
        if sat <= 0 {
            sat = 0.00001
        }
        
        
        return UIColor(hue: hue, saturation: sat, brightness: 1, alpha: 1)
    }
    
    private func pointFromColor(color : UIColor) -> CGPoint {
        
        var h : CGFloat = 0
        var s : CGFloat = 0
        
        color.getHue(&h, saturation: &s, brightness: nil, alpha: nil)
        
        let x = h * self.frame.width
        
        let y = ((s * self.frame.height) - self.frame.height) * -1        
        return CGPoint(x: x, y: y)
    
    }
    
    private func updateWithTouch(touch: UITouch) {
        
        self.updateWithPoint(touch.locationInView(self))
        
        
        }
    
    private func updateWithPoint(point: CGPoint){
        let color = self.colorFromPoint(point)
        
        self.thumbView.center = self.pointWithPadding(point, padding: ColorHSPickerView.kThumbViewEdgePadding)
        self.thumbView.backgroundColor = color;
        self.currentColor = color
    }

}
