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
  let renderer: VisualRenderer
  var startA: Angle
  var sizeA: Angle

  init() {
    hoverAni.onUpdate = {
      calcColors()
      renderer.paint()
    }

    stateAnim.onUpdate = {
      startA = stateAnim.value
      renderer.render()
      Stage.redraw()
    }
  }

  func onRotate(offset) {
    startA = sourcePad.angle.cc
    // Just redraw
    //renderer.redraw()
    Stage.redraw()
  }

  func onSize(offset) {
    startA = sourcePad.angle.cc
    sizeA = sourcePad.angle.cw
    // Render and redraw
    renderer.render()
    Stage.redraw()
  }

  onHistoryState() {
    stateAnim.start(from: startA, to: sourcePad.angle.cc)
    // Render and redraw
    renderer.render()
    Stage.redraw()
  }
}



/// PLATFORM

class SourcePadRenderer: VisualRenderer {
  weak var context: NSContext
  weak var sourcePadVisual: SourcePadVisual
  var path: NSPath

  func paint() {
    // Geometry is not changed when this is called
    view.setNeedsRedraw(getRect(sourcePadVisual))
  }

  // func redraw() {
  //   view.needsRedraw = true
  // }

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