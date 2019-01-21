//
//  AppSettings.swift
//  QnA
//
//  Created by wonkwh on 21/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Foundation

enum QueryStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    func queryStrategy(for quesryGroup: QueryGroup) -> QueryStrategy {
        switch self {
        case .random:
            return RandomQueryStrategy(queryGroup: quesryGroup)
        case .sequential:
            return SerialQueryStrategy(queryGroup: quesryGroup)
        }
    }
}

struct Keys {
    static let queryStrategy = "queryStrategy"
}

class AppSettings {
    
    static let shared = AppSettings()
    
    private let userDefaults = UserDefaults.standard
    
    var queryStrategyType: QueryStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.queryStrategy)
            return QueryStrategyType(rawValue: rawValue)!
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Keys.queryStrategy)
        }
    }
    
    private init() {}
    
    func queryStrategy(for queryGroup: QueryGroup) -> QueryStrategy {
        return queryStrategyType.queryStrategy(for: queryGroup)
    }
}

