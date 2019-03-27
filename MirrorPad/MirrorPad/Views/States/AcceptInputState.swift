
import UIKit

class AcceptInputState: DrawViewState {
  override func animate() {
    let animateState = transitionToState(matching: AnimateState.identifier)
    animateState.animate()
  }
  
  override func clear() {
    let clearState = transitionToState(matching: ClearState.identifier)
    clearState.clear()
  }
  
  override func copyLines(from source: DrawView) {
    let copyState = transitionToState(matching: CopyState.identifier)
    copyState.copyLines(from: source)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: drawView) else {
      return
    }
    let line = LineShape(color: drawView.lineColor, width: drawView.lineWidth, startPoint: point)
    drawView.lines.append(line)
    drawView.layer.addSublayer(line)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: drawView),
        let currentLine = drawView.lines.last else {
      return
    }
    currentLine.addPoint(point)
  }
}
