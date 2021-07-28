//
//  ViewController.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import UIKit

public protocol ViewController: UIViewController {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType { get }
    
    func setup()
    func bindUI()
}

public class BaseViewController<ViewModelType: ViewModel>: UIViewController, ViewController {
    public let viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup() {}
    public func bindUI() {}
    
    public override func viewDidLoad() {
        viewModel.setup()
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setup()
        bindUI()
        viewModel.didBindUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear(animated)
    }

}
