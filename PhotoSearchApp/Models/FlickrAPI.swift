//
//  FlickrAPI.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/02.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FlickrAPI {
    
    static var photos: [Photo] = []

    // API Request
    static func getPhotos(keyword: String, completion: @escaping(([Photo]) -> Void)) {
        let requestUrl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=\(apiKeys.flickrAPIKey)&tags=\(keyword)"
        photos = []
        Alamofire.request(requestUrl)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                let body = JSON(object)
                for (_, b) in body["photos"]["photo"] {
                    let farm = b["farm"].int
                    let id = b["id"].string
                    let ispublic = b["ispublic"].int
                    let owner = b["owner"].string
                    let secret = b["secret"].string
                    let server = b["server"].string
                    let title = b["title"].string
                    let photo: Photo = Photo(farm: farm, id: id, ispublic: ispublic, owner: owner, secret: secret, server: server, title: title)
                    self.photos.append(photo)
                }
                completion(self.photos)
        }
    }
}
