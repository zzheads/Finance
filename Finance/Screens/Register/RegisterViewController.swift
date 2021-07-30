//
//  RegisterViewController.swift
//  Finance
//
//  Created by Алексей Папин on 30.07.2021.
//

import SnapKit

// MARK: - RegisterViewController
final class RegisterViewController: BaseViewController<RegisterViewModel> {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.separatorStyle = .none
        view.dataSource = self
        view.registerCells(ofRows: viewModel.rows)
        view.rowHeight = UITableView.automaticDimension
        return view
    }()
    
    override func setup() {
        super.setup()
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)
        row.configure(cell: cell)
        return cell
    }
}

extension RegisterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.rows[indexPath.row].height
    }
}
