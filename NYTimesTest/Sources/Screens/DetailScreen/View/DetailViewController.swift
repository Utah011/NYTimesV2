//
//  DetailViewController.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 01.03.2021.
//

import Foundation
import UIKit
import PinLayout

class DetailViewController: UIViewController {

    let contentView = DetailScreenView()
    var data: Information?
    var dataMultimedia: Multimedia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    override func loadView() {
        view = contentView
    }
    
    func commonInit(){
        guard let data = data else { return }
        guard let dataMultimedia = dataMultimedia else { return }

        contentView.textTitle.text = data.title
        contentView.textAbstract.text = data.abstract
        contentView.textByLine.text = data.byline
        contentView.newsImageView.setImage(imageURL: dataMultimedia.url ?? "error imageURL in commonInit")
    }
}
