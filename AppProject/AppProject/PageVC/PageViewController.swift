//
//  PageViewController.swift
//  AppProject
//
//  Created by Daniil on 13.10.2022.
//

import UIKit

// Класс отвечает за Onboarding
final class PageViewController: UIPageViewController {
    
    // MARK: - Public properties
    let proxy = UIPageControl.appearance()
    let firstOnboardVC = FirstOnboardViewController()
    let secondOnboardVC = SecondOnboardViewController()
    let thirdOnboardVC = ThirdOnboardViewController()

    lazy var pageViewControllers = [firstOnboardVC, secondOnboardVC, thirdOnboardVC]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configPageControl()
    }
    
    // MARK: - init PageVC
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        view.backgroundColor = .white
        dataSource = self
        delegate = self
        setViewControllers([pageViewControllers[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    // MARK: - Private methods
    private func configPageControl() {
        proxy.pageIndicatorTintColor = .gray
        proxy.currentPageIndicatorTintColor = .systemBlue
        proxy.numberOfPages = 3
        proxy.backgroundStyle = .minimal
        firstOnboardVC.nextPageButton.addTarget(self,
                                                action: #selector(goToSecondPageAction),
                                                for: .touchUpInside)
        firstOnboardVC.skipPageButton.addTarget(self,
                                                action: #selector(dismissOnboardAction),
                                                for: .touchUpInside)
        secondOnboardVC.nextPageButton.addTarget(self,
                                                 action: #selector(goToThirdPageAction),
                                                 for: .touchUpInside)
        secondOnboardVC.skipPageButton.addTarget(self,
                                                 action: #selector(dismissOnboardAction),
                                                 for: .touchUpInside)
        thirdOnboardVC.getStartedButton.addTarget(self,
                                                  action: #selector(dismissOnboardAction),
                                                  for: .touchUpInside)
    }
    
    @objc private func goToSecondPageAction() {
        setViewControllers([secondOnboardVC], direction: .forward, animated: true)
    }
    
    @objc private func goToThirdPageAction() {
        setViewControllers([thirdOnboardVC], direction: .forward, animated: true)
    }
    
    @objc private func dismissOnboardAction() {
        dismiss(animated: true)
    }
}

extension PageViewController {
    enum Constants {
        static let skipText = "SKIP"
        static let fatalErrorText = "init(coder:) has not been implemented"
    }
}

// MARK: - UIPageViewControllerDelegate, UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard
            let vc = viewController as? UIViewController,
            let index = pageViewControllers.firstIndex(of: vc),
            index > 0
                else {
                   return nil
        }
        if let index = pageViewControllers.firstIndex(of: vc) {
            if index > 0 {
                return pageViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard
            let vc = viewController as? UIViewController,
            let index = pageViewControllers.firstIndex(of: vc),
            index > 0
                else {
                   return nil
        }
        if let index = pageViewControllers.firstIndex(of: vc) {
            if index < pageViewControllers.count - 1 {
                return pageViewControllers[index + 1]
        }
    }
        return nil
}
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let firstLabel = firstOnboardVC.pageTextLabel
        let secondLabel = secondOnboardVC.pageTextLabel
        let thirdLabel = thirdOnboardVC.pageTextLabel
        
        let userDef = UserDefaults.standard
        userDef.set("", forKey: "")
        
        UILabel.animate(withDuration: 0.1) {
            firstLabel.alpha = 1
            self.firstOnboardVC.descriptionLabel.alpha = 1
            secondLabel.alpha = 1
            self.secondOnboardVC.descriptionLabel.alpha = 1
            thirdLabel.alpha = 1
            self.thirdOnboardVC.descriptionLabel.alpha = 1
    }
}
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        firstOnboardVC.pageTextLabel.alpha = 0
        firstOnboardVC.descriptionLabel.alpha = 0
        secondOnboardVC.pageTextLabel.alpha = 0
        secondOnboardVC.descriptionLabel.alpha = 0
        thirdOnboardVC.pageTextLabel.alpha = 0
        thirdOnboardVC.descriptionLabel.alpha = 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
