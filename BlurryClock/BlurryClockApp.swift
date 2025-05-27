//
//  BlurryClockApp.swift
//  BlurryClock
//
//  Created by Muukii on 2025/05/27.
//

import SwiftUI
import HexColorMacro

@main
struct BlurryClockApp: App {
  var body: some Scene {
    WindowGroup {
      ZStack {
        #hexColor("D9D9D9")
          .ignoresSafeArea()
        ScaledView(baseSize: .init(width: 300, height: 300)) {
          ContentView()
            .padding(120)
        }
      }
      .onAppear {
        UIApplication.shared.isIdleTimerDisabled = true
      }
    }
  }
}

