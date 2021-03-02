//
//  URLImageView.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 01.03.2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String){
        self.kf.setImage(with: URL(string: imageURL))
    }
}
