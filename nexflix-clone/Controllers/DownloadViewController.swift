//
//  DownloadViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class DownloadViewController: UIViewController {

    
    let stackview:UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 2
        return sv
    }()
    let mainStackview:UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(stackview)
        view.addSubview(mainStackview)
        configureNavBar()
        applyConstrains()
    }
    
    func applyConstrains(){
        
        
        
        stackview.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0,
                         left: view.leftAnchor, paddingLeft: 0,
                         right: view.rightAnchor, paddingRight: 0)
        mainStackview.anchor(top: stackview.bottomAnchor, paddingTop: 40,
                             left: view.leftAnchor, paddingLeft: 50,
                             right: view.rightAnchor, paddingRight: 50)
        
        
        let label = UILabel()
        label.text = "スマートダウンロード"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "gearshape")
        imageview.anchor(width:30,height: 30)
        imageview.tintColor = .white
        
        stackview.addArrangedSubview(imageview)
        stackview.addArrangedSubview(label)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ファンタスティックビースト")
        imageView.layer.cornerRadius = (view.frame.width - 100) / 2
        imageView.clipsToBounds = true
        
        
        let settingButton = UIButton()
        settingButton.setTitle("設定", for: .normal)
        settingButton.tintColor = .white
        settingButton.backgroundColor = .link
        settingButton.layer.cornerRadius = 5
        
        let searchButton = UIButton()
        searchButton.setTitle("ダウンロードできる作品を探す", for: .normal)
        searchButton.setTitleColor(UIColor.black, for: .normal)
        searchButton.backgroundColor = .white
        searchButton.layer.cornerRadius = 5
        searchButton.titleLabel?.adjustsFontSizeToFitWidth = true
        view.addSubview(settingButton)
        view.addSubview(searchButton)
        view.addSubview(imageView)
        
        imageView.anchor(top: mainStackview.bottomAnchor, paddingTop: 10,
                         width: view.frame.width - 100, height: view.frame.width - 100)
        imageView.centerX(inView: view)
        settingButton.anchor(top: imageView.bottomAnchor, paddingTop: 30,
                             left: view.leftAnchor, paddingLeft: 50,
                             right: view.rightAnchor, paddingRight: 50)
        searchButton.anchor(top: settingButton.bottomAnchor, paddingTop: 10,
                             left: view.leftAnchor, paddingLeft: 80,
                             right: view.rightAnchor, paddingRight: 80)
        
        settingMainStackView()
        
    }
    func settingMainStackView(){
        let label1 = UILabel()
        label1.text = "オススメダウンロードをご紹介"
        label1.textColor = .white
        label1.font = UIFont.boldSystemFont(ofSize: 20)
        label1.textAlignment = .center
        
        let label2 = UILabel()
        label2.font = UIFont.systemFont(ofSize: 12)
        label2.text = "ご利用中のデバイスでいつでもご視聴をお楽しみいただけるようにおすすめの映画やテレビをダウンロードします。"
        label2.textAlignment = .center
        label2.numberOfLines = 0
        label2.textColor = .gray
       
        mainStackview.addArrangedSubview(label1)
        mainStackview.addArrangedSubview(label2)
        
        
    }
    private func configureNavBar(){
        let titleLabel = UILabel()
        titleLabel.text = "ダウンロード"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let profileBarButton =  UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .done, target: self, action:#selector(pushSearchView))
        let smartBarButton =  UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: #selector(pushSearchView))
        let searchBarButton =  UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(pushSearchView))
        

        navigationItem.rightBarButtonItems = [profileBarButton, smartBarButton,searchBarButton]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
    }
    @objc func pushSearchView(){
        print("遷移します")
        let vc = SearchViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}
