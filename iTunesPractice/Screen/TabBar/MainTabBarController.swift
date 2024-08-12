//
//  MainTabBarController.swift
//  iTunes
//
//  Created by 여성은 on 8/12/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let today = TodayViewController()
        let nav1 = UINavigationController(rootViewController: today)
        nav1.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book"))
       
        let game = GameViewController()
        let nav2 = UINavigationController(rootViewController: game)
        nav2.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller"))
        
        let app = AppViewController()
        let nav3 = UINavigationController(rootViewController: app)
        nav3.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        
        let acade = AcadeViewController()
        let nav4 = UINavigationController(rootViewController: acade)
        nav4.tabBarItem = UITabBarItem(title: "아케이드", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        
        let search = SearchViewController()
        let nav5 = UINavigationController(rootViewController: search)
        nav5.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
    }
}

