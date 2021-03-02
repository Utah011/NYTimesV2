//
//  ViewController.swift
//  NYTimesTest
//
//  Created by Andrew Kolbasov on 25.02.2021.
//

import UIKit
import Alamofire

class HomeNewsViewController: UIViewController {
    
    let contentView = NewsScreenView()
    var items: [Information] = []
    var itemsImage: [Multimedia] = []
    var selectedItem: Information?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "The Newsman"
        setTableView()
        fetchNewsFeeds()
    }


    override func loadView() {
        view = contentView
    }
    
    func setTableView(){
        contentView.myTableView.delegate = self
        contentView.myTableView.dataSource = self
        contentView.myTableView.register(HomeNewsTableViewCell.self, forCellReuseIdentifier: contentView.cellId)
    }

}

extension HomeNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: contentView.cellId) as? HomeNewsTableViewCell else {
            assertionFailure("ReviewsTableViewCell is not available")
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.newsFeeds = item
        cell.diffirentFontSizes()
        
        let itemImage = items[indexPath.row].multimedia?[indexPath.section]
        cell.newsFeedsImage = itemImage
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        selectedItem = items[indexPath.row]
        let multimediaItem = items[indexPath.row].multimedia?[indexPath.section]
        detailVC.data = selectedItem
        detailVC.dataMultimedia = multimediaItem
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeNewsViewController {
    func fetchNewsFeeds() {
        AF.request("https:api.nytimes.com/svc/topstories/v2/home.json?api-key=OmLqn5ruzVzmp2GOk3jrn1G8RTX8tACg").validate().responseDecodable(of: NewsFeedsModel.self) { (responce) in
            guard let news = responce.value else { return }
            self.items = news.all
            self.contentView.myTableView.reloadData()
        }
    }
}
