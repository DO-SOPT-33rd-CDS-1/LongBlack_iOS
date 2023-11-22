//
//  HomeTabBarController.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/19/23.
//

import UIKit

import SnapKit
import Then

final class HomeTabBarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
            self.setTabBarItems()
            self.setTabBarAppearance()
        }
    }
    
    private var tabs: [UIViewController] = []
    
    let homeViewController = HomeViewController()
    let alarmViewController = AlarmViewController()
    let myPageViewController = MyPageViewController()

    private let homeTabBar = HomeTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeAreaHeight = view.safeAreaInsets.bottom
        let tabBarHeight: CGFloat = 56
        tabBar.frame.size.height = tabBarHeight + safeAreaHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight - safeAreaHeight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        setTabBarItems()
    }
    
    private func setDelegate() {
        self.delegate = self
    }
    
    // MARK: - TabBar Style
    private func setTabBarAppearance() {
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(homeTabBar, forKey: "tabBar")
        object_setClass(self.tabBar, HomeTabBar.self)
        self.tabBar.itemPositioning = .fill
        
        let myFont = UIFont(name: "Pretendard-Medium", size: 13.0)!
        let fontAttributes = [NSAttributedString.Key.font: myFont, NSAttributedString.Key.foregroundColor: UIColor.subGray4]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        UITabBar.clearShadow()
        tabBar.layer.applyShadow()
    }
    
    func setTabBarItems() {
        tabs = [
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: alarmViewController),
            UINavigationController(rootViewController: myPageViewController)
        ]
        
        self.setViewControllers(tabs, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }

        for (index, controller) in tabs.enumerated() {
            if let tabBarItem = controller.tabBarItem {
                let myFont: UIFont
                let textColor: UIColor
                if index == defaultIndex {
                    myFont = UIFont(name: "Pretendard-Regular", size: 13.0)!
                    textColor = UIColor.subGray1
                } else {
                    myFont = UIFont(name: "Pretendard-Medium", size: 13.0)!
                    textColor = UIColor.subGray4
                }
                let defaultFontAttributes = [NSAttributedString.Key.font: myFont, NSAttributedString.Key.foregroundColor: textColor]
                tabBarItem.setTitleTextAttributes(defaultFontAttributes, for: .normal)
            }
        }
    }
}

extension HomeTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let selectedViewController = tabBarController.selectedViewController {
            let myFont = UIFont(name: "Pretendard-Regular", size: 13.0)!
            let selectedFontAttributes = [NSAttributedString.Key.font: myFont, NSAttributedString.Key.foregroundColor: UIColor.subGray1]
            selectedViewController.tabBarItem.setTitleTextAttributes(selectedFontAttributes, for: .normal)
        }
        
        for (index, controller) in tabBarController.viewControllers!.enumerated() {
            if let tabBarItem = controller.tabBarItem {
                if index != tabBarController.selectedIndex {
                    let myFont = UIFont(name: "Pretendard-Medium", size: 13.0)!
                    let defaultFontAttributes = [NSAttributedString.Key.font: myFont, NSAttributedString.Key.foregroundColor: UIColor.subGray4]
                    tabBarItem.setTitleTextAttributes(defaultFontAttributes, for: .normal)
                }
            }
        }
    }
}
