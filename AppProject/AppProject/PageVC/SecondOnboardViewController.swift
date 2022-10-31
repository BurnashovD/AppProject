//
//  SecondOnboardViewController.swift
//  AppProject
//
//  Created by Daniil on 13.10.2022.
//

import UIKit

// Класс отвечает за вторую страницу Onboard
final class SecondOnboardViewController: UIViewController {
    
    // MARK: - Visual components
    private lazy var pageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 80, width: view.bounds.width, height: (view.bounds.height) / 2)
        imageView.image = UIImage(named: Constants.imageName)
        return imageView
    }()
    
    lazy var pageTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        label.center = CGPoint(x: view.center.x, y: 580)
        label.textColor = .darkGray
        label.text = Constants.labelText
        label.textAlignment = .center
        label.alpha = 0
        label.font = UIFont(name: Constants.timesNewRomanFont, size: 28)
        return label
    }()
    
    lazy var skipPageButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 710, width: 80, height: 40)
        button.setTitle(Constants.skipText, for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    lazy var nextPageButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 280, y: 710, width: 80, height: 40)
        button.setTitle(Constants.nextText, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        return button
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        label.center = CGPoint(x: view.center.x, y: 620)
        label.textColor = .lightGray
        label.text = Constants.descriptionText
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: Constants.timesNewRomanLightFont, size: 1)
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        view.backgroundColor = .white
        view.addSubview(pageImageView)
        view.addSubview(pageTextLabel)
        view.addSubview(nextPageButton)
        view.addSubview(skipPageButton)
        view.addSubview(descriptionLabel)
    }
}

extension SecondOnboardViewController {
    enum Constants {
        static let imageName = "page2"
        static let labelText = "Plan Your Pregnancy"
        static let timesNewRomanFont = "TimesNewRomanPS-BoldMT"
        static let descriptionText = "Favorable days are important. Vestibulum rutrum quam vitae fringila tincidunt."
        static let timesNewRomanLightFont = "TimesNewRomanPS"
        static let nextText = "NEXT"
        static let skipText = "SKIP"
    }
}
