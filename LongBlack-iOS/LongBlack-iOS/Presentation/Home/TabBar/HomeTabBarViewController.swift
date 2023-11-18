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
    
    private var tabs: [UIViewController] = []
    
    let homeViewController = HomeViewController()
    let alarmViewController = AlarmViewController()
    let myPageViewController = MyPageViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()

        self.setTabBarItems()
        self.setTabBarAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeAreaHeight = view.safeAreaInsets.bottom
        let tabBarHeight: CGFloat = 90.0
        tabBar.frame.size.height = tabBarHeight + safeAreaHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight - safeAreaHeight
    }
    
    private func setDelegate() {
        self.delegate = self
    }
    
    // MARK: - TabBar Item
    
    func setTabBarItems() {
        
        tabs = [
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: alarmViewController),
            UINavigationController(rootViewController: myPageViewController)
        ]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
    
    // MARK: - TabBar Style

    func setTabBarAppearance() {
        
        let offset = UIOffset(horizontal: 0, vertical: -7) /// 수직 방향으로 -7만큼
        tabBar.items?.forEach { item in
            item.titlePositionAdjustment = offset
        }
        tabBar.standardAppearance = UITabBarAppearance().then {
            $0.configureWithOpaqueBackground()
            $0.backgroundColor = .white
        }
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.tintColor = .black

        let myFont = UIFont(name: "Pretendard-Medium", size: 13.0)!
        let fontAttributes = [NSAttributedString.Key.font: myFont, NSAttributedString.Key.foregroundColor: UIColor.subGray4]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        UITabBar.clearShadow()
        tabBar.layer.applyShadow()
    }
}

// MARK: - TabBar Custom Font

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
