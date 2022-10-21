//
//  HomeViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

enum Sections: Int {
    case popularMovie = 0
    case Upcoming = 1
    case latest = 2
    case TopRated = 3
}



class HomeViewController: UIViewController {
    

    let sectionTitles:[String] = ["Netflixで人気の作品","視聴中のコンテンツ","人気急上昇の作品","もう一度見る"]
    private let homeFeedTableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        tableView.register( CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(homeFeedTableView)
        
        let headerView = HeaderUIView(frame: CGRect(x: 0, y:0, width:view.frame.width, height: 450))
        homeFeedTableView.tableHeaderView = headerView
        homeFeedTableView.delegate = self
        homeFeedTableView.dataSource = self
        configureNavBar()
        getTrendMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTableView.frame = view.bounds
    }
    
    private func getTrendMovies(){
        APIManager.shared.getUpComingMovies { results in
            switch results{
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    @objc func pushSearchView(){
        print("遷移します")
        let vc = SearchViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func configureNavBar(){
        //logo画像のサイズが大きいと真ん中に表示される
        // 40*40に変更する
        var logoImage = UIImage(named: "netflix_logo_48")
        logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(pushSearchView))
        ]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
//        navigationController?.navigationBar.tintColor = .black
    }
    

    

}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        switch indexPath.section {
            case Sections.popularMovie.rawValue:
                APIManager.shared.getTrendMovies { results in
                    switch results{
                        case .success(let movies):
                            cell.configure(with: movies)
                        case .failure(let error):
                            print(error)
                    }
                }
            case Sections.Upcoming.rawValue:
                APIManager.shared.getUpComingMovies { results in
                    switch results{
                        case .success(let movies):
                            cell.configure(with: movies)
                        case .failure(let error):
                            print(error)
                    }
                }
            case Sections.latest.rawValue:
                APIManager.shared.getPopularMovies { results in
                    switch results{
                        case .success(let movies):
                            cell.configure(with: movies)
                        case .failure(let error):
                            print(error)
                    }
                }
            case Sections.TopRated.rawValue:
                APIManager.shared.getTrendMovies { results in
                    switch results{
                        case .success(let movies):
                            cell.configure(with: movies)
                        case .failure(let error):
                            print(error)
                    }
                }
            default:
                return UITableViewCell()
        }
            
        
        cell.configure(with: [Movie]())
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //headerの文字fontを変更したりする
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        header.textLabel?.textColor = .white
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: -offset)
    }
    
}
