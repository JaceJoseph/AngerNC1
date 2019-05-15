//
//  AngerRecordsViewController.swift
//  AngerTracker
//
//  Created by Jesse Joseph on 14/05/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

let appendEmotionDataKey = "co.jace.appendEmotion"

class AngerRecordsViewController: UIViewController {
    
    let appendKey = Notification.Name(appendEmotionDataKey)

    @IBOutlet weak var emotionCollectionView: UICollectionView!
    
    var emotionRecords = [UserEmotionData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObserver()
        self.emotionCollectionView.backgroundColor = .clear
        emotionCollectionView.delegate = self
        emotionCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(AngerRecordsViewController.updateUI(notification:)), name: appendKey, object: nil)
    }
    
    @objc func updateUI(notification:NSNotification){
        emotionRecords.append(notification.userInfo?["key"] as! UserEmotionData)
        emotionCollectionView.reloadData()
    }

}

extension AngerRecordsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotionRecords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = emotionRecords[indexPath.row].emotionImage
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! AngerRecordCollectionViewCell
        
        cell.setCell(image: row)
        
        return cell
    }
}
