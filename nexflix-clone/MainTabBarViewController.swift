//
//  ViewController.swift
//  nexflix-clone
//
//  Created by 薮木翔大 on 2022/10/17.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcommingViewController())
        let vc3 = UINavigationController(rootViewController: DownloadViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        vc3.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        vc1.title = "ホーム"
        vc2.title = "新着&ホット"
        vc3.title = "ダウンロード"
        
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "play.rectangle.on.rectangle.fill")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "arrow.down.circle.fill")
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .black
        
        setViewControllers([vc1,vc2,vc3], animated: true)
    }


}

