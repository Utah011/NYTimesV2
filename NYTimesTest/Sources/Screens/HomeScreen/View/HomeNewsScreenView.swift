//
//  NewsScreenView.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 25.02.2021.
//

import UIKit
import PinLayout

class NewsScreenView: UIView {
    
    let cellId = "HomeNewsTableViewCell"
    let myTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        
        myTableView.separatorStyle = .none
        myTableView.estimatedRowHeight = 20
        addSubview(myTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myTableView.pin
            .all()
    }

}
