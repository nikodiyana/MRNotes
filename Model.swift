


struct Scene {
  var innerRim[]: Source
  var outerRim[]: Source
}

struct Source {
  var angles = (cc: Float, cw: Float)
  var dimmer: Dimmer.BaseModel
}



struct Dimmer.Model: BaseModel {
  var: value: Float
  var fader: Float
  var spot: Float
  var spotCenter: Float
}
