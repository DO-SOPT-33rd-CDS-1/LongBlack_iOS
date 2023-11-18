//
//  HomeTabBarItem.swift
//  LongBlack-iOS
//
//  Created by 정채은 on 11/19/23.
//


import UIKit

enum TabBarItem: Int, CaseIterable {
    case note
    case alarm
    case myPage
}

extension TabBarItem {
    var title: String {
        switch self {
        case .note:   return StringLiterals.Home.TabBar.note
        case .alarm:         return StringLiterals.Home.TabBar.alarm
        case .myPage:         return StringLiterals.Home.TabBar.myPage
        }
    }
}

extension TabBarItem {
    var Icon: UIImage? {
        switch self {
        case .note:  return ImageLiterals.TabBar.icNote
        case .alarm:        return ImageLiterals.TabBar.icAlarm
        case .myPage:        return ImageLiterals.TabBar.icMyPage
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .note:  return ImageLiterals.TabBar.icNoteSelected.withRenderingMode(.alwaysOriginal)
        case .alarm:        return ImageLiterals.TabBar.icAlarmSelected.withRenderingMode(.alwaysOriginal)
        case .myPage:        return ImageLiterals.TabBar.icMyPageSelected.withRenderingMode(.alwaysOriginal)
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        let tabBarItem = UITabBarItem(
            title: title,
            image: Icon,
            selectedImage: selectedIcon
        )
        
        tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        
        return tabBarItem
    }
}
