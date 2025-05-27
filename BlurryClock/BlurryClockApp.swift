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
      TabView {    
        Tab.init {       
          ClockView()
        } label: { 
          Label.init("Clock", systemImage: "clock.fill")
        }
        Tab.init {
          SettingsView()    
        } label: {
          Label.init("Settings", systemImage: "gear.circle.fill")
        }
      }
      .tabViewStyle(.sidebarAdaptable)
      .onAppear {
        UIApplication.shared.isIdleTimerDisabled = true
      }
    }
  }
}

