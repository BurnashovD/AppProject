//
//  ChosenItemViewController.swift
//  AppProject
//
//  Created by Daniil on 08.10.2022.
//

import UIKit

// Класс карточка выбранного товара
final class ChosenItemViewController: UIViewController {
    
    // MARK: - Visual components
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 340, height: 30)
        label.center = CGPoint(x: view.center.x, y: 120)
        label.text = productName
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
        image.center = CGPoint(x: view.center.x, y: 250)
        image.image = UIImage(named: productImageName)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Public properties
    var productName = ""
    var productImageName = ""

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        view.addSubview(productNameLabel)
        view.addSubview(productImageView)
    }
}
