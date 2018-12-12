//
//  SerialQueryStrategy.swift
//  QnA
//
//  Created by wonkwh on 12/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import Foundation

class SerialQueryStrategy: QueryStrategy {

    var correntCount: Int = 0
    var incorrentCount: Int = 0
    
    private let queryGroup: QueryGroup
    private var queryIndex = 0
    
    init(queryGroup: QueryGroup) {
        self.queryGroup = queryGroup
    }
    
    var title: String {
        return queryGroup.title
    }
    
    func nextQuery() -> Bool {
        guard queryIndex + 1 < queryGroup.queries.count else {
            return false
        }
        
        queryIndex += 1
        return true
    }
    
    func currentQuery() -> Query {
        return queryGroup.queries[queryIndex]
    }
    
    func markQueryCorrect(_ query: Query) {
        correntCount += 1
    }
    
    func markQueryInCorrect(_ query: Query) {
        incorrentCount += 1
    }
    
    func queryIndexTitle() -> String {
        return "\(queryIndex + 1)/\(queryGroup.queries.count)"
    }
    
    
}
