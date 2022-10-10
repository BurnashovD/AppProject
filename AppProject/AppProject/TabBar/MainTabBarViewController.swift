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
        
        buyVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.80)
        buyVC.tabBarItem = UITabBarItem(title: Constants.buyTitleText, image: UIImage(systemName: Constants.laptopIphoneImageName), tag: 2)
        
        searchVC.tabBarItem = UITabBarItem(title: Constants.searchText, image: UIImage(systemName: Constants.magnifyImageName), tag: 0)
        searchVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.80)
        
        forMeVC.tabBarItem = UITabBarItem(title: Constants.forYouText, image: UIImage(systemName: Constants.personCircleImageName), tag: 1)
        forMeVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.80)
        
        cartVC.tabBarController?.tabBar.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.80)
        cartVC.tabBarItem = UITabBarItem(title: Constants.cartText, image: UIImage(systemName: Constants.bagImageName), tag: 1)
        
        let navigationController = UINavigationController(rootViewController: searchVC)
        
        viewControllers = [buyVC, forMeVC, navigationController, cartVC]
    }
}

extension MainTabBarViewController {
    enum Constants {
        static let buyTitleText = "Купить"
        static let laptopIphoneImageName = "laptopcomputer.and.iphone"
        static let searchText = "Поиск"
        static let magnifyImageName = "magnifyingglass"
        static let forYouText = "Для Вас"
        static let personCircleImageName = "person.circle"
        static let cartText = "Коризна"
        static let bagImageName = "bag"
    }
}
