//
//  ThirdOnboardViewController.swift
//  AppProject
//
//  Created by Daniil on 13.10.2022.
//

import UIKit

// Класс отвечает за третью страницу Onboard
final class ThirdOnboardViewController: UIViewController {
    
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
        label.alpha = 1
        label.font = UIFont(name: Constants.timesNewRomanFont, size: 28)
        return label
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
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        button.center = CGPoint(x: view.center.x, y: 727)
        button.setTitle(Constants.getStartedtext, for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
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
        view.addSubview(descriptionLabel)
        view.addSubview(getStartedButton)
    }
}

// Constants enum
extension ThirdOnboardViewController {
    enum Constants {
        static let imageName = "page3"
        static let labelText = "Daily Health Insight"
        static let timesNewRomanFont = "TimesNewRomanPS-BoldMT"
        static let descriptionText = "Personal health insight. Vestibulum rutrum quam vitae fringilla tincidunt"
        static let timesNewRomanLightFont = "TimesNewRomanPS"
        static let getStartedtext = "GET STARTED!"
    }
}
