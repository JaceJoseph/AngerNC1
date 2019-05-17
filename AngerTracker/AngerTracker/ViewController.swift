//
//  ViewController.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 14/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import SpriteKit

var meanData = 0

class ViewController: UIViewController {
 
    @IBOutlet weak var viewSK: Particle_View!
    
    @IBOutlet weak var mainEmotionImageIndicator: UIImageView!

    var count = [0,0,0,0,0]
    var totalAngerValue = 0

    @IBOutlet var emotionChart: [UISlider]!
    
    //sliders
    @IBOutlet weak var sliderLevel1: UISlider!
    @IBOutlet weak var sliderLevell2: UISlider!
    @IBOutlet weak var sliderLevel3: UISlider!
    @IBOutlet weak var sliderLevel4: UISlider!
    @IBOutlet weak var sliderLevel5: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSK.setupView(value: 0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushedAddEmotionRecord(_ sender: UIButton) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "AddEmotionRecord") as! AddEmotionRecordViewController
        
        destVC.submitEmotionDelegate = self
        
        present(destVC, animated: true, completion: nil)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
    }
    
    func updateCount()->Int{
        var dataCount = 0
        for numbers in count{
            dataCount += numbers
        }
        return dataCount
    }
    
    func calculateMean(total:Int,count:Int)->Int{
        if count == 0{
            return 1
        }else{
            let mean = total/count
            return mean
        }
    }
    
    func imageCalculator(value:Int){
        switch value {
        case 0...20:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "EmojiLevel1")
        case 21...40:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "EmojiLevel2S")
        case 41...60:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "EmojiLevel3")
        case 61...80:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "EmojiLevel4")
        case 81...100:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "EmojiLevel5")
        default:
            return
        }
    }
    
    func updateChart(){
        for charts in emotionChart{
            charts.maximumValue += 1
        }
    }
}

extension ViewController:submitEmotion{
    
    func didTapSubmitEmotion(value: Int,image:UIImage) {
        
        updateChart()
        
        switch value {
        case 0...20:
            count[0] += 1
           sliderLevel1.value += 1
        case 21...40:
            count[1] += 1
             sliderLevell2.value += 1
        case 41...60:
            count[2] += 1
            sliderLevel3.value += 1
        case 61...80:
            count[3] += 1
            sliderLevel4.value += 1
        case 81...100:
            count[4] += 1
             sliderLevel5.value += 1
        default:
            return
        }
        
        totalAngerValue += value
        let dataCount = updateCount()
        let mean = calculateMean(total: totalAngerValue, count: dataCount)
        
        meanData = mean
        
        imageCalculator(value: mean)
        
        viewSK.setupView(value: mean)
    }
}
