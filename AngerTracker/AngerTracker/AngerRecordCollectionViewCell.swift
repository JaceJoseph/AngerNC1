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
    func setCell(image:UIImage){
        emojiImage.image = image
    }
}
