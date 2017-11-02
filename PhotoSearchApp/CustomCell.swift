//
//  CustomCell.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/02.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var titleLabel:UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
}
