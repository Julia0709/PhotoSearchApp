//
//  Generaters.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/03.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class Generaters {
    // Image URL Generater
    static func generateImageUrl(photo: Photo, size: String) -> String {
        let farm = "farm\(photo.farm!)"
        let server: String = String(describing: photo.server!)
        let id = String(describing: photo.id!)
        let secret = String(describing: photo.secret!)
        return "https://\(farm).staticflickr.com/\(String(describing: server))/\(id)_\(secret)_\(size).jpg"
    }
}
