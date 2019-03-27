
import UIKit

class ClearState: DrawViewState {
  override func clear() {
    drawView.lines = []
    drawView.layer.sublayers?.removeAll()
    transitionToState(matching: AcceptInputState.identifier)
  }
}

