//
//  StartPageViewController.swift
//  AppProject
//
//  Created by Daniil on 12.10.2022.
//

import UIKit

final class StartPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    private func configUI() {
        self.dataSource = self
    }
    
    private func generatePageVC(index: Int) -> StartViewController? {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "") as? StartViewController)
        return vc
    }

}

extension StartPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}
