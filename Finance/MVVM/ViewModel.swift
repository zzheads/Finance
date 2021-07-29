//
//  ViewModel.swift
//  Finance
//
//  Created by Алексей Папин on 27.07.2021.
//

import Foundation

public protocol ViewModel: AnyObject {
    func setup()
    func viewDidLoad()
    func didBindUI()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

public class BaseViewModel: NSObject, ViewModel {
    public func setup() {}
    public func viewDidLoad() {}
    public func didBindUI() {}
    public func viewWillAppear(_ animated: Bool) {}
    public func viewDidAppear(_ animated: Bool) {}
    public func viewWillDisappear(_ animated: Bool) {}
    public func viewDidDisappear(_ animated: Bool) {}
}
