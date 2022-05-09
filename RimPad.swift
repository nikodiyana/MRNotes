class RimPad {
  let vector: Float

  init() {
    vector = 0
  }

  func set(scene: Scene) {

  }
}



class InnerRimPad {
  override init() {
    vector = 1
  }

  override set(scene: Scene) {
    sources = scene.innerSources;
  }
}



class OuterRimPad {
  override init() {
    vector = -1
  }

  override set(scene: Scene) {
    sources = scene.outerSources;
  }
}
