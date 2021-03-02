//
//  DetailScreenView.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 01.03.2021.
//

import Foundation
import UIKit
import PinLayout

class DetailScreenView: UIView, UIScrollViewDelegate {
    
    let myScrollView = UIScrollView()
    var newsImageView = UIImageView()
    var textTitle = UILabel()
    var textAbstract = UILabel()
    var textByLine = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(newsImageView)
        
        textTitle.numberOfLines = 0
        textTitle.font = Fonts.semiBold30
        textTitle.text = "no title text here"
        addSubview(textTitle)
        
        textAbstract.numberOfLines = 0
        textAbstract.font = Fonts.regular22
        textAbstract.text = "no abstract text here"
        addSubview(textAbstract)
        
        textByLine.numberOfLines = 0
        textByLine.font = Fonts.light14
        textByLine.text = "no byLine text here"
        addSubview(textByLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsImageView.pin
            .top(pin.safeArea)
            .left()
            .right()
            .height(236)
        
        textTitle.pin
            .below(of: newsImageView)
            .marginTop(30)
            .horizontally(16)
            .sizeToFit(.width)
        
        textAbstract.pin
            .below(of: textTitle)
            .marginTop(15)
            .horizontally(16)
            .sizeToFit(.width)
        
        textByLine.pin
            .below(of: textAbstract)
            .marginTop(15)
            .horizontally(16)
            .sizeToFit(.width)
    }

}
