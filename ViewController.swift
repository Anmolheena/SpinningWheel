//
//  ViewController.swift
//  12marspinningWheel
//
//  Created by Appinventiv-PC on 12/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self// Do any additional setup after loading the view, typically from a nib.
        collectionViewOutlet.collectionViewLayout = CircularCollectionViewlayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
//     class func layoutAttributesClass() -> AnyClass {
//        return CircularCollectionViewLayoutAttributes.self
//    }
}


