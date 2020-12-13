//
//  HistoryView.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/13/20.
//

import DeclareUI
import KiloLocoKit
import UIKit

class HistoryView: UIView {
    
    private lazy var tableView = UITableView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SearchedTermCell.self, forCellReuseIdentifier: SearchedTermCell.reuseIdentifier)
    }
    
    init() {
        super.init(frame: .zero)
        configureSelf()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HistoryView {
    func configureSelf() {
        backgroundColor = .systemBackground
    }
    
    func configureSubviews() {
        addSubview(tableView)
        tableView.declare
            .toSuperviewGuide()
    }
}

extension HistoryView {
    func bindTableView<Manager: UITableViewDataSource & UITableViewDelegate>(to manager: Manager) {
        tableView.dataSource = manager
        tableView.delegate = manager
    }
    
    func reload() {
        tableView.reloadData()
    }
}
