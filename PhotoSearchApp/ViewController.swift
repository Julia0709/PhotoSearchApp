//
//  ViewController.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/02.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Number of sections
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    // Display each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCell
        cell.titleLabel.text = "title\(indexPath.row)"
        cell.imageView.image = UIImage(named: "no_image.png")
        return cell
    }
}
