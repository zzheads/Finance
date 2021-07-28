//
//  MainTabController.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit

final class TabBarController: UITabBarController {
    let viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setViewControllers(viewModel.tabControllers, animated: true)
    }
    
    func bindUI() {
        
    }
    
    override func viewDidLoad() {
        viewModel.setup()
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setup()
        bindUI()
        viewModel.didBindUI()
    }
}
