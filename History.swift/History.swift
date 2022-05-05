
class History {
  let disc: SourceDisc!
  var events: Events = []
  var marker: UInt

  History(disc: SourceDisc) {
    self.disc = disc
  }

  func add(_ event: Event) {
    // Delete the entries from the event list after the marker
    if (marker != events.size-1) {
      for i in marker..events.size-1 {
        events.remove(i)
      }
    }

    // Add the new event to the end of the events list
    events.append(event);

    // Call delegate
  }

  func back() {
    if marker == 0 {
      print("Can't go back. History marker is at first step (0)")
      // Call delegate.onFirstStep()
    } else {
      events.get(marker).back();
      marker--
      // Call delegate.onStep(marker)
    }
  }

  func forward() {
    if marker == events.size-1 {
      print("Can't go forward. History marker at last step (\(marker))")
      // Call delegate.onLastStep()
    } else {
      events.get(marker).forward();
      marker++
      // Call delegate.onStep(marker)
    }
  }

  func go(to step: UInt) {
    // Validate step
    step = max(step, events.size)

    // Do nothing if no change in step
    if step == marker { return }

    // Loop events from current marker to step
    // call back() or forward of each event according to the loop direction
    if step < marker {  // Backwards
    for i in (marker)...step.reversed() {
        events.get(i).back()
      }
    } else {            // Forwards
      for i in marker...step {
        events.get(i).forward()
      }
    }

    marker = step
    // Call delegate.onStep(marker)
  }
}
