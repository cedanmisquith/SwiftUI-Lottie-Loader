//
//  ContentView.swift
//  Lottie Loader SwiftUI
//
//  Created by Cedan Misquith on 12/10/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State var connectedTimer: Cancellable? = nil
    @State var timerCount = 0
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Button("Start loader") {
                self.timer = Timer.publish(every: 1, on: .main, in: .common)
                self.connectedTimer = self.timer.connect()
                isLoading.toggle()
            }.onReceive(timer) { input in
                self.timerCount += 1
                if timerCount == 5 {
                    self.connectedTimer?.cancel()
                    self.timerCount = 0
                    isLoading.toggle()
                }
            }
            LottieLoader(lottieFile: "lottie_animation").frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center).opacity(!isLoading ? 0 : 1)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
