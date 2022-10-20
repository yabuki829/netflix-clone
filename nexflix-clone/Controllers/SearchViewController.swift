//
//  SearchViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class SearchViewController: UIViewController {
    var movies = [Movie]()
    
    let tableView:UITableView = {
        let tableview = UITableView()
        tableview.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("searchViewcontrollwe")
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
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    private func fetchUpcomming(){
        print("データを取得します")
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
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    
}
