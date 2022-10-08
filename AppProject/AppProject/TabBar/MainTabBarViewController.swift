//
//  MainTabBarViewController.swift
//  AppProject
//
//  Created by Daniil on 08.10.2022.
//

import UIKit

// Класс конфигуратор для TabBar
final class MainTabBarViewController: UITabBarController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBarController()
    }
    
    // MARK: - Private methods
    private func configTabBarController() {
        let buyVC = BuyViewController()
        let searchVC = SearchViewController()
        let forMeVC = ForMeViewController()
        let cartVC = CartViewController()
        
        buyVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        buyVC.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 2)
        
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        searchVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.00)
        
        forMeVC.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "person.circle"), tag: 1)
        forMeVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        
        cartVC.title = "Коризна"
        cartVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
        cartVC.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "bag"), tag: 1)
        
        let navigationController = UINavigationController(rootViewController: searchVC)
        
        viewControllers = [buyVC, forMeVC, navigationController, cartVC]
    }
    
}
