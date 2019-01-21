//
//  AppSettingsController.swift
//  QnA
//
//  Created by wonkwh on 21/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class AppSettingController: UITableViewController {
    
    // MARK: - Properties
    let appSettings = AppSettings.shared
    fileprivate let cellIdentifier = "basicCell"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "App Setting"
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension AppSettingController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QueryStrategyType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let queryStrategyType = QueryStrategyType.allCases[indexPath.row]
        cell.textLabel?.text = queryStrategyType.title()
        
        if appSettings.queryStrategyType == queryStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AppSettingController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let queryStrategyType = QueryStrategyType.allCases[indexPath.row]
        appSettings.queryStrategyType = queryStrategyType
        
        tableView.reloadData()
    }
}
