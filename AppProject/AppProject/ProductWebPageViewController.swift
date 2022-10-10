//
//  ProductWebPageViewController.swift
//  AppProject
//
//  Created by Daniil on 10.10.2022.
//

import UIKit
import WebKit

// Класс открывает страницу товара в интернете
final class ProductWebPageViewController: UIViewController {
    
    private let productWebView: WKWebView = {
        let webConfig = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfig)
        return web
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        guard let productURL = URL(string: "https://re-store.ru/catalog/10114PRO512PPLE/") else { return }
        let productRequest = URLRequest(url: productURL)
        productWebView.load(productRequest)
        view = productWebView
    }
}
