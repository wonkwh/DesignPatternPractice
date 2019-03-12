//
//  Filter.swift
//  CoffeeQuest
//
//  Created by wonkwh on 12/03/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Foundation

public struct Filter {
  let filter: (Business) -> Bool
  var businesses: [Business]

  public static func identity() -> Filter {
    return Filter(filter: { _ in return true }, businesses: [])
  }
  
  static func starRating(atLeast starRating:Double ) -> Filter {
    return Filter(filter: { $0.rating >= starRating }, businesses: [])
  }
  
  func filterBusinesses() -> [Business] {
    return businesses.filter(filter)
  }
}

extension Filter: Sequence {
  public func makeIterator() -> IndexingIterator<[Business]> {
    return filterBusinesses().makeIterator()
  }
}
