class Event {
  let disc: SourceDisc

  func back() { }

  func forward() { }



  class AddSource: Event {
    weak var source: Source!

    AddSource(_ source: Source) {
        self.source = source;
    }

    @Override
    func back() {
      // Check source.isInner first
      disc.innerRimPad.remove(self.source);
    }

    // Model version - used to modify given model for generating a glyph
    @Override
    func back(in device: Device) {
      // Check source.isInner first
      device.innerRim.remove(self.source);
    }

    @Override
    func forward() {
      // Check source.isInner first
      device.innerRimPad.add(self.source);
    }

    // ...
  }



  class RemoveSource: Event {
    weak var source: Source

    @Override
    func back(in device: Device) {
      disc.add(self.sourcePad);
    }

    @Override
    func forward(in device: Device) {
      disc.remove(self.sourcePad);
    }
  }



  class RotateSourcePad: Event {
    let id: Int
    let isInner: Bool
    let offset: Float

    @Override
    func back() {
      disc.rotate(id, -offset);
    }

    @Override
    func forward() {
      disc.rotate(id, +offset);
    }
  }



  // Called on a single edge rotate
  class ResizeSourcePad: Event {
    let id: Int
    let edgeId: Int
    let offset: Float

    @Override
    func back() {
      disc.rotate(id, edgeId, -offset);
    }

    @Override
    func forward() {
      disc.rotate(id, edgeId, +offset);
    }
  }



  // Called on size scale
  class ScaleSourcePad: Event {
    let id: Int
    let offset: Float

    @Override
    func back() {
      disc.rotate(id, -offset);
    }

    @Override
    func forward() {
      disc.rotate(id, +offset);
    }
  }



  // Called when both edges are moved at the same time (multi-touch)
  class SetBoundsSourcePad: Event {
    let id: Int
    let startEdgeOffset: Float
    let endEdgeOffset: Float

    @Override
    func back() {
      disc.rotateEdges(-startEdgeOffset, -endEdgeOffset);
    }

    @Override
    func forward() {
      disc.rotateEdges(+startEdgeOffset, +endEdgeOffset);
    }
  }
}
