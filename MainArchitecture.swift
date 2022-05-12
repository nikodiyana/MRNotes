class ControlUnit {
  var scheme = Scheme()

  var infoPanel = InfoPanel()
  var com = Com(self)
  var discPad = DiscPad(self)
}



protocol InfoDisplay {
  func showDimmer(value: Float, lastValue: Float)
  func hide()
}

class ConsoleInfo: InfoDisplay {
  func showDimmer(value: Float, lastValue: Float) {
    let offset = value - lastValue
    print("Dimmer value: \(value) (\(lastValue) \(offset)")
  }

  func hide() { }
}

class CALayerInfoPanel: InfoDisplay {
  func showDimmer(value: Float, lastValue: Float) {
    centerGauge.show(value)
    leftGauge.show(lastValue)
    rightGauge.show(value - lastValue)
  }
}


protocol ComLink {
  init(Com com)
  func connect()
  func disconect()
  func send(data: UInt8[])
}

class BTComLink {
  let com: Com!
  init(Com com) {
    self.com = com
  }


}


class Com {
  var link = BTLink() //BLELink, UDPLink, TCPLink
  func sync(SourcePad sourcePad) {
    //serialize
    link.send(data)
  }
  func onReceive(data[]) {
    //deserialize
    //input to ControlUnit 
  }
}
