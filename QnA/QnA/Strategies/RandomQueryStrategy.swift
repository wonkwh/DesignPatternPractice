//
//  RandomQueryStrategy.swift
//  QnA
//
//  Created by wonkwh on 12/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import GameplayKit.GKRandomSource

class RandomQueryStrategy: QueryStrategy {
    var correntCount: Int = 0
    var incorrentCount: Int = 0
    
    private let queryGroup: QueryGroup
    private var queryIndex = 0
    private let queries: [Query]
    
    init(queryGroup: QueryGroup) {
        self.queryGroup = queryGroup
        
        // get random source using GKRandomSource
        let random = GKRandomSource.sharedRandom()
        self.queries = random.arrayByShufflingObjects(in: queryGroup.queries) as! [Query]
        debugPrint(self.queries)
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
        return queries[queryIndex]
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

