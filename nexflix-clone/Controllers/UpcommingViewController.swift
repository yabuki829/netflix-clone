//
//  UpcommingViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class UpcommingViewController: UIViewController {

    var movies = [Movie]()
    let tableView:UITableView = {
        let tableview = UITableView()
        tableview.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchUpcomming()
        configureNavBar()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureNavBar(){
        let titleLabel = UILabel()
        titleLabel.text = "新着&ホット"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .done, target: self, action:#selector(pushSearchView)),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: #selector(pushSearchView)),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(pushSearchView))
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func pushSearchView(){
        print("遷移します")
        let vc = SearchViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
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


extension UpcommingViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
