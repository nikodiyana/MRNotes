class PolarShape {
  var: center: Point
}

class Circle {
  var: center
  var: radius
}

class Ring: Circle {
  var minorRadius
  var midRadius
  var breadth
}

class Sector {
  var: ccAngle
  var: cwAngle
  var: midAngle
}

class Cluster {
  var: ring: Ring
  var: sector: Sector
}
