//
//  HomeNewsTableViewCell.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 25.02.2021.
//

import UIKit
import PinLayout

class HomeNewsTableViewCell: UITableViewCell {
    
    let newsImageView = UIImageView()
    let backView = UIView()
    let textTitle = UILabel()
    
    var newsFeeds: Information? {
        didSet {
            guard let news = self.newsFeeds else { return }
            textTitle.text = news.title
        }
    }
    
    var newsFeedsImage: Multimedia? {
        didSet {
            guard let newsImage = self.newsFeedsImage else { return }
            newsImageView.setImage(imageURL: newsImage.url ?? "error imageURL in commonInit")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        
        backView.backgroundColor = .white
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 16
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.black.cgColor
        addSubview(backView)
        
        textTitle.numberOfLines = 0
        addSubview(textTitle)
        
        newsImageView.backgroundColor = .white
        newsImageView.contentMode = .scaleToFill
        newsImageView.clipsToBounds = true
        newsImageView.layer.cornerRadius = 16
        newsImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setConstrains()
    }
    
    func diffirentFontSizes(){
        guard let numberOfLetters = textTitle.text?.count else { return }
        
        switch numberOfLetters {
        case 1..<60:
            textTitle.font = Fonts.semiBold35
        default:
            textTitle.font = Fonts.semiBold25
        }
    }
    
    func setConstrains(){
        
        textTitle.pin
            .top(30)
            .left(18)
            .right(25)
            .sizeToFit(.width)
        
        newsImageView.pin
            .below(of: textTitle)
            .marginTop(20)
            .horizontally(18)
            .height(220)
        
        backView.pin
            .top(25)
            .horizontally(20)
            .bottom(to: newsImageView.edge.bottom)
            .margin(-10)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        contentView.pin
            .width(size.width)

        setConstrains()
        
        return CGSize(width: contentView.frame.width, height: textTitle.frame.maxY + newsImageView.frame.height + 50)
    }
    
}
