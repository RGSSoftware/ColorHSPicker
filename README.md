<a href="https://github.com/RGSSoftware/HireMe">
  <img src="https://github.com/RGSSoftware/HireMe/blob/master/HireMeBanner.png" >
</a>

# ColorHSPicker

[![Version](https://img.shields.io/cocoapods/v/ColorHSPicker.svg?style=flat)](http://cocoapods.org/pods/ColorHSPicker)
[![License](https://img.shields.io/cocoapods/l/ColorHSPicker.svg?style=flat)](http://cocoapods.org/pods/ColorHSPicker)
[![Platform](https://img.shields.io/cocoapods/p/ColorHSPicker.svg?style=flat)](http://cocoapods.org/pods/ColorHSPicker)

A hue and saturation color-picker for iOS.

<img src="https://github.com/RGSSoftware/ColorHSPicker/blob/master/screenshot.png" alt="iPhone 5" width="396" />

## Installation

ColorHSPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ColorHSPicker"
```

## Using a ColorHSPicker from a View Controller
```swift

import ColorHSPicker

class ColorViewController: UIViewController {

    var hsPicker: ColorHSPickerView!
    
    var color : UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ...
        
        self.color = UIColor.yellowColor()
        self.hsPicker.color = self.color
        self.hsPicker.addTarget(self, action: "hsPickerValueChanged:", forControlEvents: .ValueChanged)
    }
    
    func hsPickerValueChanged(sender:ColorHSPickerView){
        
        if let color = sender.color {
            self.color = color
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ...
        
        self.hsPicker.color = self.color
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
      
        ...
    
        self.hsPicker.color = self.color
        
    }

}

```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

ColorHSPicker is available under the MIT license. See the LICENSE file for more info.
