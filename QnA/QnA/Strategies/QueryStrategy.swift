//
//  QueryStrategy.swift
//  QnA
//
//  Created by wonkwh on 12/12/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import Foundation

protocol QueryStrategy: class {
    
    var title: String { get }
    
    var correntCount: Int { get }
    var incorrentCount: Int { get }
    
    func nextQuery() -> Bool
    func currentQuery() -> Query
    
    func markQueryCorrect(_ query: Query)
    func markQueryInCorrect(_ query: Query)
    
    func queryIndexTitle() -> String
}
