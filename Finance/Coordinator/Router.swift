//
//  Router.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit

// MARK: - Router
public protocol Router: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
}
