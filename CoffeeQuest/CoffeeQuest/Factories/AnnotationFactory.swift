//
//  AnnotationFactory.swift
//  CoffeeQuest
//
//  Created by wonkwh on 12/03/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit
import MapKit
import YelpAPI

class AnnotationFactory {
  public func createBusinessMapViewModel(for business: Business) -> MapViewModel? {
    let name = business.name
    let rating = business.rating
    let image:UIImage
    
    switch rating {
    case 0.0..<3.0:
      image = #imageLiteral(resourceName: "terrible")
    case 3.0..<3.5:
      image = #imageLiteral(resourceName: "bad")
    case 3.5..<4.0:
      image = #imageLiteral(resourceName: "meh")
    case 4.0..<4.75:
      image = #imageLiteral(resourceName: "good")
    case 4.75..<5.0:
      image = #imageLiteral(resourceName: "great")
    default:
      image = #imageLiteral(resourceName: "bad")
    }
    
    return MapViewModel(coordinate: business.location!, name: name, rating: rating, image: image)
  }
}


