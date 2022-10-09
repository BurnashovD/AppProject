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
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var firstImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 50, y: 0, width: 300, height: 200)
        return image
    }()
    
    private lazy var secondImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 50 + view.bounds.width, y: 0,
                             width: 300, height: 200)
        return image
    }()
    
    private lazy var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 50 + (view.bounds.width * 2),
                             y: 0, width: 300, height: 200)
        return image
    }()
    
    private lazy var imagesScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 250)
        scroll.center = CGPoint(x: view.center.x, y: 300)
        scroll.contentSize = CGSize(width: view.bounds.width * 3, height: 220)
        scroll.contentMode = .scaleAspectFit
        scroll.isPagingEnabled = true
        scroll.indicatorStyle = .white
        scroll.showsHorizontalScrollIndicator = true
        scroll.addSubview(firstImageView)
        scroll.addSubview(secondImageView)
        scroll.addSubview(thirdImageView)
        return scroll
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 170, height: 20)
        label.center = CGPoint(x: view.center.x, y: 150)
        label.textColor = .systemGray2
        label.text = productPrice
        label.textAlignment = .center
        return label
    }()
    
    private lazy var productNameUnderImageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 250, height: 10)
        label.center = CGPoint(x: view.center.x, y: 440)
        label.text = productName
        label.textAlignment = .center
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return label
    }()
    
    private lazy var chooseProductColorGrayButton: UIButton = {
        let second = UIButton()
        second.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        second.center = CGPoint(x: view.center.x - 22, y: 500)
        second.backgroundColor = .lightGray
        second.layer.cornerRadius = 0.5 * second.bounds.size.width
        return second
    }()
    
    private lazy var chooseProductColorBlackButton: UIButton = {
        let first = UIButton()
        first.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        first.center = CGPoint(x: view.center.x + 22, y: 500)
        first.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 0.90)
        first.layer.cornerRadius = 0.5 * first.bounds.size.width
        first.layer.borderColor = UIColor.link.cgColor
        first.layer.borderWidth = 1.5
        return first
    }()
    
    private lazy var deviceConnectionLabel: UILabel = {
        let label = UILabel()
        let text1 = "Совместимо с MacBook Pro - Евгений"
        label.frame = CGRect(x: 0, y: 0, width: 220, height: 20)
        label.center = CGPoint(x: view.center.x, y: 570)
        label.text = text1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 30, height: 45)
        button.center = CGPoint(x: view.center.x, y: 660)
        button.setTitle("Добавить в корзину", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 0.90)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var deliverLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 710, width: 250, height: 10)
        label.text = "Заказ сегодня в течении дня, доставка:"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var deliverDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 725, width: 250, height: 10)
        label.text = "Чт 25 Фев - Бесплатно"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemGray2
        return label
    }()
    
    private lazy var deliverVariantsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 740, width: 350, height: 10)
        label.text = "Варианты доставки для месторасположения: 115533"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .link
        return label
    }()
    
    private lazy var boxDeliveryImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "shippingbox.fill")
        image.frame = CGRect(x: 10, y: 710, width: 20, height: 20)
        image.tintColor = .gray
        return image
    }()
    
    private lazy var howMuchTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 180, height: 20)
        field.center = CGPoint(x: view.center.x, y: 610)
        field.placeholder = Constants.howMuchPlaceholderText
        field.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        field.textColor = .white
        field.attributedPlaceholder = NSAttributedString(string: Constants.howMuchPlaceholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        field.textAlignment = .center
        return field
    }()
    
    // MARK: - Public properties
    var productName = ""
    var productImageName = [String]()
    var productPrice = ""
    private let countPickerView = UIPickerView()
    private let howMuchProductsNumbers = Array(1...12)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        addNavigationItems()
        addProductImagesOnScroll()
        view.addSubview(productPriceLabel)
        view.addSubview(productNameLabel)
        view.addSubview(imagesScrollView)
        view.addSubview(productNameUnderImageLabel)
        view.addSubview(chooseProductColorGrayButton)
        view.addSubview(chooseProductColorBlackButton)
        view.addSubview(deviceConnectionLabel)
        view.addSubview(addToCartButton)
        view.addSubview(deliverLabel)
        view.addSubview(deliverDateLabel)
        view.addSubview(deliverVariantsLabel)
        view.addSubview(boxDeliveryImageView)
        view.addSubview(howMuchTextField)
        countPickerView.dataSource = self
        countPickerView.delegate = self
        howMuchTextField.inputView = countPickerView
    }
    
    private func addProductImagesOnScroll() {
        if productImageName.count > 2 {
            let firstImage = UIImage(named: productImageName[0])
            let secondImage = UIImage(named: productImageName[1])
            let thirdImage = UIImage(named: productImageName[2])
            
            guard let image = firstImage, let secImage = secondImage, let trdImage = thirdImage else { return }
            firstImageView.image = image
            secondImageView.image = secImage
            thirdImageView.image = trdImage
        } else {
            let firstImage = UIImage(named: productImageName[0])
            let secondImage = UIImage(named: productImageName[1])
            imagesScrollView.contentSize = CGSize(width: view.bounds.width * 2, height: 200)
            
            guard let image = firstImage, let secImage = secondImage else { return }
            firstImageView.image = image
            secondImageView.image = secImage
        }
    }
    
    private func addNavigationItems() {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                          style: .done, target: self,
                                          action: #selector(openActivityControllerAction))
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart"),
                                         style: .done, target: self,
                                         action: #selector(addToFavoriteAction))
        
        navigationItem.rightBarButtonItems = [likeButton, shareButton]
    }
    
    @objc private func addToFavoriteAction() {
        
    }
    
    @objc private func openActivityControllerAction() {
        let activityVC = UIActivityViewController(activityItems: [productName],
                                                  applicationActivities: nil)
        present(activityVC, animated: true)
    }
}

extension ChosenItemViewController {
    enum Constants {
        static let howMuchPlaceholderText = "Укажите количество"
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension ChosenItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return howMuchProductsNumbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(howMuchProductsNumbers[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        howMuchTextField.text = String(howMuchProductsNumbers[row]) + " " + "шт."
        howMuchTextField.resignFirstResponder()
    }
}
