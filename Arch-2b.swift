/// PACKAGE
class SourcePad {
  let SourcePad.Visual: ControlPad.Visual

  func onRotate(offset) {
    visual.onRotate(offset)
  }

  func onSize(offset) {
    visual.onSize(offset)
  }
}



class SourcePadVisual extends ControlPad.Visual {
  weak var sourcePad: SourcePad // Owner of this visual
  var startA: Angle
  var sizeA: Angle

  init() {
    hoverAni.onUpdate = {
      paint()
    }

    stateAnim.onUpdate = {
      startA = stateAnim.value
      //..
    }
  }

  func onRotate(offset) {
    startA = sourcePad.angle.cc
  }

  func onSize(offset) {
    startA = sourcePad.angle.cc
    sizeA = sourcePad.angle.cw
  }

  onHistoryState() {
    stateAnim.start(from: startA, to: sourcePad.angle.cc)
  }

  
}



/// PLATFORM

class CGSourcePadVisual: SourcePadVisual {
  var path: NSPath

  override func paint() {
    // Geometry is not changed when this is called
    view.setNeedsRedraw(getRect(sourcePadVisual))
  }

  override onSize() {
    super.onSize()
    render()
  }

  override onRotate() {
    super.onRotate()
    matrixAngle = startA
  }

  func render() {
    path.reset()
    path.add(Arc(0, sourcePadVisual.sizeA))
    redraw()
  }

  func draw()
    context.rotate(startA)
      context.draw(path)
  }
}
