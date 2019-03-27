
import Foundation

protocol Copying {
  init(_ prototype: Self)
}

extension Copying {
  func copy() -> Self {
    return type(of: self).init(self)
  }
}

extension Array where Element: Copying {
  func deepCopy() -> [Element] {
    return map {$0.copy()}
  }
}
