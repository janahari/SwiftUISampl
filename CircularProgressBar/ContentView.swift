//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by apple on 24/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircularProgress()
        }
        .padding()
    }
}

struct CircularProgress: View {
    @State private var progress: Double = 0.0
  //  @State private var isRunning = false
    @State private var startTask = false
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 20.0)
                .opacity(0.2)
                .foregroundColor(.purple)
            Text(String(format: "%.0f%%", min(self.progress, 1) * 100))
                .font(.system(size: 60))
            Circle()
                .trim(from: 0.0,to: CGFloat(self.progress))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.purple)
                .animation(.linear, value: progress)
           
            Button("Fetch Data") {
                progress = 0
               // isRunning = true
                startTask.toggle()
            }
            .offset(y: 250)
        }
//        .onReceive(timer) { _ in
//            guard isRunning else { return }
//            if progress < 1 {
//                progress += 0.1
//            } else {
//                isRunning = false
//            }
//        }
        .task(id: startTask) {
            guard startTask else { return }
            for _ in 0..<10 {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                if Task.isCancelled {
                    return
                }
                progress += 0.1
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
