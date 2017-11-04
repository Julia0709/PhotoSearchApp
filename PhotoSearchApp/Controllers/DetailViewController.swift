//
//  DetailViewController.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/03.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedPhoto: Photo!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageView
        let screenWidth = UIScreen.main.bounds.size.width
        imageView.frame.size.width = screenWidth
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        imageView.image = UIImage(named: "no_image.png")
        let url = URL(string: Generaters.generateImageUrl(photo: selectedPhoto, size: "b"))
        if url != nil {
            let data = try? Data(contentsOf: url!)
            imageView.image = UIImage(data: data!)!
        }
    }
}
