//
//  ExchangesViewController.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import UIKit
import SnapKit

final class ExchangesViewController: BaseViewController<ExchangesViewModel> {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.register(ExchangeIdCell.self, forCellReuseIdentifier: ExchangeIdCell.identifier)
        return view
    }()
    
    override func setup() {
        super.setup()
        addSubviews()
        makeConstraints()
    }
    
    override func bindUI() {
        super.bindUI()
        viewModel.reloadTableView = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ExchangesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeIdCell.identifier, for: indexPath) as! ExchangeIdCell
        cell.configure(with: viewModel.models[indexPath.row])
        return cell
    }
}
