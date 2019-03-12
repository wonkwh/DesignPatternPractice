//
//  Protocols.swift
//  CoffeeQuest
//
//  Created by wonkwh on 12/03/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Foundation
import MapKit
import YelpAPI

public struct Business {
  var name: String
  var rating: Double
  var location: CLLocationCoordinate2D?
}

public struct SearchResults {
  var businesses: [Business]
  var total: UInt
}

public protocol SearchResultsProtocol {
  func adaptSearchResultsFromYelP() -> SearchResults
}

public protocol BusinessProtocol {
  func adaptBusinessFromYelp() -> Business
}

extension YLPLocation {
  func getCoordinateFromYelp() -> CLLocationCoordinate2D? {
    guard let latitude = self.coordinate?.latitude,
          let longtitude = self.coordinate?.longitude else {
      return nil
    }
    
    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    return coordinate
  }
}

extension YLPBusiness: BusinessProtocol {
  public func adaptBusinessFromYelp() -> Business {
    return Business(name: self.name, rating: self.rating, location: self.location.getCoordinateFromYelp())
  }
}

extension YLPSearch: SearchResultsProtocol {
  public func adaptSearchResultsFromYelP() -> SearchResults {
    let businesses = self.businesses.map { (business: YLPBusiness) in
      business.adaptBusinessFromYelp()
    }
    return SearchResults(businesses: businesses, total: self.total)
  }
}
