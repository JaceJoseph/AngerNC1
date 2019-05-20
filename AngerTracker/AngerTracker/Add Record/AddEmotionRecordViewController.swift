//
//  AddEmotionRecordViewController.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 14/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

protocol submitEmotion {
    func didTapSubmitEmotion(value:Int,image:UIImage)
}

import UIKit

class AddEmotionRecordViewController: UIViewController {
    
    var submitEmotionDelegate:submitEmotion!

    @IBOutlet weak var particleView: Particle_View!
    @IBOutlet weak var emotionValue: UISlider!
    @IBOutlet weak var emotionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        particleView.setupView(value: meanData)
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func pushedSubmitEmotion(_ sender: UIButton) {
        let desiredValue = Int(emotionValue.value)
        let desiredImage = emotionImage.image
        submitEmotionDelegate.didTapSubmitEmotion(value: desiredValue,image: desiredImage!)
        
        let appendKey = Notification.Name(appendEmotionDataKey)
        
        NotificationCenter.default.post(name: appendKey, object: nil, userInfo: ["key":UserEmotionData(emotionImage: desiredImage!, value: desiredValue)])
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        
        let fixedValue = round(sender.value/20)*20
        sender.setValue(fixedValue, animated: true)
        
        switch fixedValue{
        case 0...20:
            emotionImage.image = #imageLiteral(resourceName: "EmojiLevel1")
        case 21...40:
            emotionImage.image = #imageLiteral(resourceName: "EmojiLevel2")
        case 41...60:
            emotionImage.image = #imageLiteral(resourceName: "EmojiLevel3")
        case 61...80:
            emotionImage.image = #imageLiteral(resourceName: "EmojiLevel4")
        case 81...100:
            emotionImage.image = #imageLiteral(resourceName: "EmojiLevel5")
        default:
            return
        }
    }
    
}
