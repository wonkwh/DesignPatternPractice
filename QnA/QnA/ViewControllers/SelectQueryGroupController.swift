//
//  QueryGroupController.swift
//  QnA
//
//  Created by wonkwh on 11/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import UIKit

class SelectQueryGroupController: UITableViewController {

    let queryGrpoups = QueryGroup.allGroups()
    fileprivate var selectedQueryGroup: QueryGroup!
    
    override func viewDidLoad() {
        navigationItem.title = "Select Query Group"
        
        tableView.tableFooterView = UIView()
        tableView.register(QueryGroupCell.self, forCellReuseIdentifier: "QueryGroupCell")
    }
}

// UITableViewDataSource
extension SelectQueryGroupController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queryGrpoups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueryGroupCell", for: indexPath) as! QueryGroupCell
        let queryGroup = queryGrpoups[indexPath.row]
        cell.titleLabel.text = queryGroup.title
        return cell
    }
}

//Mark: - UITableViewDelegate
extension SelectQueryGroupController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let queryController = QueryController()
        queryController.queryStrategy = RandomQueryStrategy(queryGroup: selectedQueryGroup)
        queryController.delegate = self
        navigationController?.pushViewController(queryController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQueryGroup = queryGrpoups[indexPath.row]
        return indexPath
    }
}

// MARK: - QueryControllerDelegate
extension SelectQueryGroupController: QueryControllerDelegate {
    func queryController(_ viewController: QueryController, didCancel queryStrategy: QueryStrategy, at queryIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    func queryController(_ viewController: QueryController, didComplete queryStrategy: QueryStrategy, at queryIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }
}

class QueryGroupCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(percentageLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        
        percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        percentageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
