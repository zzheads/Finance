//
//  TabBarItem.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit

public enum TabBarItem: String, CaseIterable {
    enum Appearance {
        static let selectedTintColor: UIColor = .black
        static let unselectedTintColor: UIColor = .lightGray
    }
    
    case first
    case exchanges
    case third

    public var tag: Int {
        rawValue.hashValue
    }
    
    public var title: String {
        rawValue
    }
    
    public var image: UIImage? {
        UIImage(systemName: rawValue)?.withTintColor(Appearance.unselectedTintColor)
    }
    
    public var selectedImage: UIImage? {
        image?.withTintColor(Appearance.selectedTintColor)
    }
    
    public var item: UITabBarItem {
        let systemItem: UITabBarItem.SystemItem
        switch self {
        case .first: systemItem = .topRated
        case .exchanges: systemItem = .bookmarks
        case .third: systemItem = .more
        }
        return .init(tabBarSystemItem: systemItem, tag: tag)
    }
    
    public var controller: UIViewController {
        let controller: UIViewController
        switch self {
        case .first:
            controller = LoginViewController(viewModel: LoginViewModel())
            
        case .exchanges:
            let parser = ApplicationAssembly.resolver.resolve(HandbookParser<ExchangeId>.self)!
            controller = ExchangesViewController(viewModel: ExchangesViewModel(handbookParser: parser))
            
        default:
            controller = UIViewController()
        }
        controller.tabBarItem = item
        controller.view.backgroundColor = .white
        return controller
    }
}
