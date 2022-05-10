

struct Device {
    var scene: Scene
    var sequence: Sequence
    var cameraAngle: Angle
}

struct Scene {
  var innerRim[]: Source
  var outerRim[]: Source
}

struct Source {
  var angles = (cc: Float, cw: Float)
  var dimmer: Any?
}

struct Dimmer.Model {

}
