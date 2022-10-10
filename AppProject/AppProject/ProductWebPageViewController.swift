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
    
    // MARK: - Visual Components
    private let productWebView: WKWebView = {
        let webConfig = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfig)
        return web
    }()
    
    // MARK: - Public properties
    var productsURL = ""
    var webType = ""

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configWeb()
    }
    
    // MARK: - Private methods
    private func configWeb() {
        if webType == "web" {
            guard let productURL = URL(string: productsURL) else { return }
            let productRequest = URLRequest(url: productURL)
            productWebView.load(productRequest)
            productWebView.addSubview(addToolBar())
            view = productWebView
        } else if webType == "pdf" {
            guard let pdfURL = Bundle.main.url(forResource: "HW", withExtension: "pdf") else { return }
            let productRequest = URLRequest(url: pdfURL)
            productWebView.load(productRequest)
            productWebView.addSubview(addToolBar())
            view = productWebView
        }
    }

    private func addToolBar() -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 720, width: view.frame.size.width, height: 50))
        toolBar.backgroundColor = .black
        
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.chevronBackwardmageName),
                                             style: .plain,
                                             target: self,
                                             action: #selector(goBackPageAction))
        
        let forwardButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.chevronForwadrImageName),
                                                style: .plain,
                                                target: self,
                                                action: #selector(goForwardPageAction))
        
        let refreshPageButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                    target: self,
                                                    action: #selector(refreshPageAction))
        
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(dismissWebPage))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: self,
                                            action: nil)
        
        let shareLinkButtonItem = UIBarButtonItem(title: Constants.reStoreLink,
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(shareLinkAction))
        toolBar.items = [backButtonItem,
                         forwardButtonItem,
                         shareLinkButtonItem,
                         flexibleSpace,
                         refreshPageButtonItem,
                         doneButtonItem]
        return toolBar
    }
    
    @objc private func goBackPageAction() {
        productWebView.goBack()
    }
    
    @objc private func goForwardPageAction() {
        productWebView.goForward()
    }
    
    @objc private func refreshPageAction() {
        productWebView.reload()
    }
    
    @objc private func dismissWebPage() {
        dismiss(animated: true)
    }
    
    @objc private func shareLinkAction() {
        let activityController = UIActivityViewController(activityItems: [productsURL], applicationActivities: nil)
        present(activityController, animated: true)
    }
}

extension ProductWebPageViewController {
    enum Constants {
        static let chevronForwadrImageName = "chevron.forward"
        static let chevronBackwardmageName = "chevron.backward"
        static let reStoreLink = "re-store.ru"
    }
}
