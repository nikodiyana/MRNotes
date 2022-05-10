// In package:
protocol GlyphFactory {
  func create(from RingPadDelegate: delegate) -> Glyph
  func create(from SourcePadDelegate: delegate) -> Glyph
}

protocol Glyph {
  func get(from pad: Any?) -> self
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
  func get(from pad: RingPadDelegate) -> self {
    return self
  }

  @override
  func render() {
    path.addArc(rimPadDelegate.bounds.radius.out, ...)

    // call SourcePadGlyphs render() methods
  }

  @override
  func draw() {
    context.drawPath(...)

    // call SourcePadGlyphs draw() methods
  }
}



class MacOSCGGlyphFactory: GlyphFactory {
  @override
  func create(from RingPadDelegate: delegate) -> Glyph {
    return MacOSRimPadGlyph(delegate);
  }
}
