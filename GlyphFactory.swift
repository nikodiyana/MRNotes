// In package:
protocol GlyphFactory {
  func create(from RingPadDelegate: delegate) -> Glyph
  func create(from SourcePadDelegate: delegate) -> Glyph
}

protocol Glyph {
  func render()
  func draw()
}

//
//
//

class MacOSRimPadGlyph: Glyph {
  var path: CGPath
  let context: CGContext // Context can be a local reference or a Static global reference
  let rimPadDelegate: rimPadDelegate // needs to be initialized on class init

  @override
  func render() {
    path.addArc(rimPadDelegate.bounds.radius.out, ...)
  }

  @override
  func draw() {
    context.drawPath(...)
  }
}



class MacOSCGGlyphFactory: GlyphFactory {
  @override
  func create(from RingPadDelegate: delegate) -> Glyph {
    return MacOSRimPadGlyph(delegate);
  }
}
