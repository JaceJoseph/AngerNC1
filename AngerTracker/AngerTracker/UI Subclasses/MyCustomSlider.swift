//
//  MyCustomSlider.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 15/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class MyCustomSlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        //keeps original origin and width, changes height, you get the idea
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 5.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }

    override func awakeFromNib() {
        setThumbImage(#imageLiteral(resourceName: "Triangle"), for: .normal)
        setThumbImage(#imageLiteral(resourceName: "Triangle"), for: .highlighted)
        setThumbImage(#imageLiteral(resourceName: "Triangle"), for: .disabled)
    }

}
