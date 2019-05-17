//
//  MyCustomSlider2.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 17/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class MyCustomSlider2: UISlider {

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        //keeps original origin and width, changes height, you get the idea
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 4.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
    override func awakeFromNib() {
    
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
