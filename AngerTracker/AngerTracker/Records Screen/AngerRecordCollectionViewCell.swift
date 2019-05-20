//
//  AngerRecordCollectionViewCell.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 14/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class AngerRecordCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiImage: UIImageView!
    @IBOutlet weak var emotionSliderValue: UISlider!
    
    override func awakeFromNib() {
        backgroundColor = .clear
    }
    
    func setCell(image:UIImage,sliderValue:Int){
        emojiImage.image = image
        emotionSliderValue.setValue(Float(sliderValue), animated: true)
    }
}
