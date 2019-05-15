//
//  Particle View.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 15/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import SpriteKit

class Particle_View: UIView {

    override func awakeFromNib() {
        
    }
    
    func setupView(value:Int){
        
        for subviews in self.subviews {
            subviews.removeFromSuperview()
        }
        
        let sk: SKView = SKView()
        sk.frame = self.bounds
        sk.backgroundColor = .black
        self.addSubview(sk)
        
        let scene: SKScene = SKScene(size: self.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        
        var en:SKEmitterNode!
        
        switch value{
        case 0...20:
            en = SKEmitterNode(fileNamed: "MyParticle.sks")
        case 21...40:
            en = SKEmitterNode(fileNamed: "MyParticle2.sks")
        case 41...60:
            en = SKEmitterNode(fileNamed: "MyParticle3.sks")
        case 61...80:
            en = SKEmitterNode(fileNamed: "MyParticle4.sks")
        case 81...100:
            en = SKEmitterNode(fileNamed: "MyParticle5.sks")
        default:
             en = SKEmitterNode(fileNamed: "MyParticle.sks")
        }
        
        en?.position = sk.center
        
        scene.addChild(en!)
        sk.presentScene(scene)
    }

}
