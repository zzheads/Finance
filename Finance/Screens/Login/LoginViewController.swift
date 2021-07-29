//
//  LoginViewController.swift
//  Finance
//
//  Created by Алексей Папин on 29.07.2021.
//

import FirebaseAuth
import SnapKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
        tableView.register(ButtonCell.nib, forCellReuseIdentifier: ButtonCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func setup() {
        super.setup()
        addSubviews()
        makeConstraints()
        tableView.reloadData()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension LoginViewController: UITableViewDataSource {
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
