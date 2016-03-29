//
//  ViewController.swift
//  ColorHSPicker
//
//  Created by Randel Smith on 03/29/2016.
//  Copyright (c) 2016 Randel Smith. All rights reserved.
//

import UIKit
import ColorHSPicker

class ColorViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var hsPicker: ColorHSPickerView!
    
    var color : UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.color = UIColor.yellowColor()
        self.previewView.backgroundColor = self.color
        self.hsPicker.color = self.color
        
        self.hsPicker.addTarget(self, action: "hsPickerValueChanged:", forControlEvents: .ValueChanged)
    }
    
    func hsPickerValueChanged(sender:ColorHSPickerView){
        
        if let color = sender.color {
            self.color = color
            self.previewView.backgroundColor = self.color
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.hsPicker.color = self.color
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.hsPicker.color = self.color
        
    }

}

