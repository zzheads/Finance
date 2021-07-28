//
//  MainTabBarViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit

final class TabBarViewModel: BaseViewModel {
    private let tabs: [TabBarItem]
    
    var tabBarItems: [UITabBarItem] {
        tabs.map { $0.item }
    }
    
    var tabControllers: [UIViewController] {
        tabs.map { $0.controller }
    }
    
    init(tabs: [TabBarItem] = TabBarItem.allCases) {
        self.tabs = tabs
    }
}
