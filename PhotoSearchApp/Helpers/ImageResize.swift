//
//  ImageResize.swift
//  PhotoSearchApp
//
//  Created by Julia on 2017/11/03.
//  Copyright © 2017 Julia. All rights reserved.
//

import UIKit

class ImageResize {
    // Get position Y: the Y value right under the above view
    static func getY(frame: CGRect) -> CGFloat {
        return frame.origin.y + frame.size.height
    }
}
