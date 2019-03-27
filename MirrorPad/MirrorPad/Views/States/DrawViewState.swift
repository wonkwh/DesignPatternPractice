
import UIKit

class DrawViewState {
  class var identifier: AnyHashable {
    return ObjectIdentifier(self)
  }
  
  // context in the state pattern
  unowned let drawView: DrawView
  
  init(drawView: DrawView) {
    self.drawView = drawView
  }
  
  // MARK: - Actions
  func animate() { }
  func copyLines(from source: DrawView) { }
  func clear() { }
  func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) { }
  func touchesMoved(_ touches:Set<UITouch>, with event: UIEvent?) { }
  
  // MARK: - State Management
  @discardableResult internal func transitionToState(matching identifier: AnyHashable) -> DrawViewState {
    let state = drawView.states[identifier]!
    drawView.currentState = state
    return state
  }
}

