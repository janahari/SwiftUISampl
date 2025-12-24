# Circular Progress Bar - SwiftUI

A simple **Circular Progress Bar** implementation in SwiftUI that demonstrates async progress updates using Swift Concurrency (`.task`) and animations.

---

## Features

- Displays a circular progress bar with percentage text.
- Animates progress smoothly.
- Uses SwiftUI's `.task` modifier for asynchronous progress updates.
- Includes a **Fetch Data** button to start the progress.

---

## Screenshot

*You can add a screenshot here after running the app.*

---

## Code Overview

The main components are:

### `ContentView`
- Entry point of the app.
- Displays the `CircularProgress` view.

### `CircularProgress`
- Uses `@State` to manage progress (`Double`) and task start state.
- Draws two circles:
  - Background circle (light purple with opacity)
  - Foreground circle trimmed based on progress
- Shows percentage text in the center.
- Animates the foreground circle when progress updates.
- Uses a button to trigger progress asynchronously using Swift Concurrency:
  ```swift
  .task(id: startTask) {
      guard startTask else { return }
      for _ in 0..<10 {
          try? await Task.sleep(nanoseconds: 2_000_000_000)
          if Task.isCancelled { return }
          progress += 0.1
      }
  }
