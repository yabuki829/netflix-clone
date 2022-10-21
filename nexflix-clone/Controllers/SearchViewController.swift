//
//  SearchViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit


// 検索画面と検索結果はuiが違う
// 検索画面はtableviewでいいけど
// 結果の方はcollectionviewで表示しないと再現は難しそう
// 検索結果がたくさんあるときもuiが違う

class SearchViewController: UIViewController {
    var movies = [Movie]()
    var resultMovies = [Movie]()
    var isSearch = false
    
    let tableView:UITableView = {
        let tableview = UITableView()
        tableview.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        return tableview
    }()
    
    
    
    let searchBar:UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "検索"
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(tableView)
        let headerLabel = UILabel(frame: CGRect(x: 0, y:0, width:view.frame.width, height: 30))
        
        headerLabel.text = "検索で人気の作品"
        tableView.tableHeaderView = headerLabel
        tableView.delegate = self
        tableView.dataSource = self

        configureNavBar()
        fetchUpcomming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func configureNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(back))
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.titleView?.frame = searchBar.frame
      
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    private func fetchUpcomming(){
        APIManager.shared.getUpComingMovies { results in
            switch results{
                case .success(let movies):
                    self.movies = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
}


extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return resultMovies.count
        }
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        if isSearch {
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearch {
            return 200
        }
        return 100
    }

    
    
}


extension SearchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text,"検索する")
    }
}
