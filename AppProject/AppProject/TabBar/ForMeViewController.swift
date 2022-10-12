//
//  ForMeViewController.swift
//  AppProject
//
//  Created by Daniil on 08.10.2022.
//

import UIKit

// Раздел подборки для пользователя
final class ForMeViewController: UIViewController {
    
    //MARK: - Visual components
    private var somethingNewLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 18, y: 180, width: 250, height: 30)
        label.text = Constants.somethingNewText
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var airPodsView: UIView = {
        let uiView = UIView()
        uiView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 160)
        uiView.center = CGPoint(x: view.center.x, y: 320)
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 10
        uiView.layer.shadowOffset = .zero
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOpacity = 0.2
        uiView.layer.shadowRadius = 5
        return uiView
    }()
    
    private var recomendedForYouLabel: UILabel = {
        let lable = UILabel()
        lable.frame = CGRect(x: 18, y: 470, width: 250, height: 40)
        lable.text = Constants.recomendedForYouText
        lable.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return lable
    }()
    
    private lazy var getNewsView: UIView = {
        let uiView = UIView()
        uiView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 10, height: 130)
        return uiView
    }()
    
    private var getNewsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 7, width: 220, height: 100)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.text = Constants.getNewsText
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private var appBadgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.appBadgeImageName)
        imageView.frame = CGRect(x: 25, y: 30, width: 40, height: 40)
        imageView.tintColor = .red
        return imageView
    }()
    
    private lazy var recomendsScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 10, height: 130)
        scroll.center = CGPoint(x: view.center.x, y: 580)
        scroll.contentSize = CGSize(width: (view.bounds.width - 10) * 2, height: 130)
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.addSubview(getNewsView)
        return scroll
    }()
    
    private var turnOnNotifyLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.turnOnNotifyText
        label.frame = CGRect(x: 90, y: 75, width: 260, height: 50)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemGray2
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var nextPageImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.chevronForwardImageName))
        imageView.frame = CGRect(x: getNewsView.bounds.width - 30,
                                 y: getNewsView.bounds.height / 2,
                                 width: 15, height: 15)
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var yourDevicesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.yourDevicecText
        label.frame = CGRect(x: 18,
                             y: view.bounds.height - 140,
                             width: 300, height: 40)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var showAllDevicesButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.showAllText, for: .normal)
        button.frame = CGRect(x: view.bounds.width - 110,
                              y: view.bounds.height - 132,
                              width: 100, height: 30)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return button
    }()
    
    private var airPodsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.airPodsImageName))
        imageView.frame = CGRect(x: 15, y: 10, width: 70, height: 70)
        return imageView
    }()
    
    private lazy var lineUnderAirPodsView: UIView = {
        let uiView = UIView()
        uiView.frame = CGRect(x: 0, y: 90, width: airPodsView.bounds.width, height: 1)
        uiView.backgroundColor = .lightGray
        return uiView
    }()
    
    private lazy var deliveryProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        progress.center = CGPoint(x: (view.bounds.width - 40) / 2, y: 120)
        progress.progress = 0.5
        progress.progressTintColor = .systemGreen
        progress.trackTintColor = .systemGray5
        return progress
    }()
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.progressText
        label.frame = CGRect(x: 0, y: 0, width: airPodsView.bounds.width, height: 30)
        label.center = CGPoint(x: airPodsView.center.x, y: 140)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private var airPodsDeliveryStatusLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.deliveryStatusText
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.frame = CGRect(x: 95, y: 15, width: 200, height: 30)
        return label
    }()
    
    private var aboutDeliveryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.aboutDeliveryText
        label.frame = CGRect(x: 95, y: 40, width: 200, height: 30)
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .lightGray
        return label
    }()
    
    private var forwardImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.chevronForwardImageName))
        imageView.frame = CGRect(x: 320, y: 40, width: 15, height: 15)
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var lineUnderNewsView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray
        uiView.frame = CGRect(x: 0, y: 660, width: view.bounds.width, height: 1)
        return uiView
    }()
    
    private var profileImageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: Constants.personImageName), for: .normal)
        button.tintColor = .black
        return button
    }()

    // MARK: - Private properties
    private let image = UIImage(systemName: Constants.personImageName)?.resieImage(to: CGSize(width: 40, height: 40))
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        congigUI()
    }
    
    // MARK: - Private methods
    private func congigUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(somethingNewLabel)
        view.addSubview(airPodsView)
        view.addSubview(recomendedForYouLabel)
        view.addSubview(getNewsView)
        view.addSubview(recomendsScrollView)
        view.addSubview(yourDevicesLabel)
        view.addSubview(showAllDevicesButton)
        view.addSubview(lineUnderNewsView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageButton)
        profileImageButton.addTarget(self, action: #selector(chooseProfileImageAction), for: .touchUpInside)
        getNewsViewConfig()
        checkUserDef()
        airPodsViewConfig()
    }
    
    private func getNewsViewConfig() {
        getNewsView.addSubview(getNewsLabel)
        getNewsView.addSubview(appBadgeImageView)
        getNewsView.addSubview(turnOnNotifyLabel)
        getNewsView.addSubview(nextPageImageView)
    }
    
    private func airPodsViewConfig() {
        airPodsView.addSubview(airPodsImageView)
        airPodsView.addSubview(lineUnderAirPodsView)
        airPodsView.addSubview(deliveryProgressView)
        airPodsView.addSubview(progressLabel)
        airPodsView.addSubview(airPodsDeliveryStatusLabel)
        airPodsView.addSubview(aboutDeliveryLabel)
        airPodsView.addSubview(forwardImageView)
    }
    
    private func sendToUserDef(image: Data) {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: Constants.personImageName) != nil else {
            defaults.setValue(image, forKey: Constants.personImageName)
            return
        }
    }
    
     private func checkUserDef() -> UIImage? {
        let userDef = UserDefaults.standard
        guard let dataImage = userDef.value(forKey: Constants.personImageName) as? Data,
        let image = UIImage(data: dataImage) else {
            let image = UIImage(systemName: Constants.personImageName)?.resieImage(to: CGSize(width: 40, height: 40))
            return image
        }
         profileImageButton.setImage(image, for: .normal)
        guard let image = UIImage(data: dataImage) else {
            let image = UIImage(systemName: Constants.personImageName)?.resieImage(to: CGSize(width: 40, height: 40))
            return image
        }
        return image
    }
    
    @objc private func chooseProfileImageAction() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        present(imagePicker, animated: true)
    }
}

extension ForMeViewController {
    enum Constants {
        static let somethingNewText = "Вот что нового"
        static let recomendedForYouText = "Рекомендуется вам"
        static let yourDevicecText = "Ваши устройства"
        static let getNewsText = "Получайте новости о своем заказе в режиме реального времени."
        static let appBadgeImageName = "app.badge"
        static let turnOnNotifyText = "Включите уведомления, чтобы получать новости о своем заказе."
        static let chevronForwardImageName = "chevron.forward"
        static let showAllText = "Показать все"
        static let airPodsImageName = "airPods"
        static let progressText = "Обрабатывается      Отправлено              Доставлено"
        static let deliveryStatusText = "Ваш заказ отправлен"
        static let aboutDeliveryText = "1 товар, доставка завтра"
        static let personImageName = "person"
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ForMeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let img = image.resieImage(to: CGSize(width: 40, height: 40))
            profileImageButton.setImage(img, for: .normal)
        
            guard let dataImage = img.pngData() else { return }
            UserDefaults.standard.set(dataImage,forKey: Constants.personImageName)
        }
        dismiss(animated: true)
    }
}

extension UIImage {
    func resieImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
