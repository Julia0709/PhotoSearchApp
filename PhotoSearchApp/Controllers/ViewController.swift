//
//  ViewController.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/02.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var keyword: String = "maple"
    var photos: [Photo] = []
    var selectedPhoto: Photo?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButton(_ sender: UIButton) {
        self.photos = []
        keyword = searchTextField.text!
        guard keyword != "" else {
            return
        }
        loadColectionView(keyword: keyword)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadColectionView(keyword: keyword)
    }
    
    // Load or update collection view
    func loadColectionView(keyword: String) {
        title = keyword
        FlickrAPI.getPhotos(keyword: keyword) { (photos) in
            self.photos = photos
            self.collectionView.reloadData()
            
            // Reset scroll
            self.collectionView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    // Number of sections
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Display each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
                as! CustomCell
        
        let photo = photos[indexPath.row]
        
        // title
        cell.titleLabel.text = photo.title
        
        // imageView
        cell.imageView.image = UIImage(named: "no_image.png")
        // q: 150x150
        let url = URL(string: Generaters.generateImageUrl(photo: photo, size: "q"))
        if url != nil {
            let data = try? Data(contentsOf: url!)
            cell.imageView.image = UIImage(data: data!)!
        }
        
        // Delegate
        selectedPhoto = photos[indexPath.row]
        return cell
    }
    
    // When a cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = photos[indexPath.row]
        if selectedPhoto != nil {
            // Call segue
            performSegue(withIdentifier: "toDetailViewController", sender: nil)
        }
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toDetailViewController") {
            let detailVC: DetailViewController = (segue.destination as? DetailViewController)!
            // Set photo data
            detailVC.selectedPhoto = self.selectedPhoto
        }
    }
}
