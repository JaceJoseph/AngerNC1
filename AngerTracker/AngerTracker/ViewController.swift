//
//  ViewController.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 14/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import SpriteKit

var backgroundColor:UIColor = .white

class ViewController: UIViewController {

    @IBOutlet weak var viewSK: UIView!
    
    @IBOutlet weak var mainEmotionImageIndicator: UIImageView!

    var count = [0,0,0,0,0]
    var totalAngerValue = 0
    
    @IBOutlet var emotionChart: [UIProgressView]!
    var progress = [Progress(totalUnitCount: 0),Progress(totalUnitCount: 0),Progress(totalUnitCount: 0),Progress(totalUnitCount: 0),Progress(totalUnitCount: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSKView()
        // Do any additional setup after loading the view.
    }
    
    func setupSKView(){
        let sk: SKView = SKView()
        sk.frame = viewSK.bounds
        sk.backgroundColor = .black
        viewSK.addSubview(sk)
        
        let scene: SKScene = SKScene(size: viewSK.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        
        let en = SKEmitterNode(fileNamed: "MyParticle.sks")
        en?.position = sk.center
        
        scene.addChild(en!)
        sk.presentScene(scene)
    }
    
    func calculateMean(total:Int,count:Int)->Int{
        if count == 0{
            return 1
        }else{
            let mean = total/count
            return mean
        }
    }
    
    func backgroundCalculator(value:Int)->UIColor{
        switch value {
        case 0...20:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "dev-setup")
            return #colorLiteral(red: 0.9956689477, green: 0.9130260348, blue: 0.1231216863, alpha: 1)
        case 21...40:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "int-overview")
            return #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 41...60:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "ss-delegates")
            return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 61...80:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "ss-uipickerview-card")
            return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 81...100:
            mainEmotionImageIndicator.image = #imageLiteral(resourceName: "vlog-4")
            return #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        default:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
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
    
    func updateChart(){
        for chartsProgress in progress{
            chartsProgress.totalUnitCount += 1
        }
        
        var counter = 0
        for charts in emotionChart{
            charts.setProgress(Float(progress[counter].completedUnitCount)-0.01, animated: true)
            counter += 1
        }
    }
    
}

extension ViewController:submitEmotion{
    
    func didTapSubmitEmotion(value: Int,image:UIImage) {
        
        switch value {
        case 0...20:
            count[0] += 1
            self.progress[0].completedUnitCount += 1
        case 21...40:
            count[1] += 1
            self.progress[1].completedUnitCount += 1
        case 41...60:
            count[2] += 1
            self.progress[2].completedUnitCount += 1
        case 61...80:
            count[3] += 1
            self.progress[3].completedUnitCount += 1
        case 81...100:
            count[4] += 1
            self.progress[4].completedUnitCount += 1
        default:
            return
        }
        
        updateChart()
        
        totalAngerValue += value
        let dataCount = updateCount()
        let mean = calculateMean(total: totalAngerValue, count: dataCount)
        
        backgroundColor = backgroundCalculator(value: mean)
        self.view.backgroundColor = backgroundCalculator(value: mean)
    }
}
