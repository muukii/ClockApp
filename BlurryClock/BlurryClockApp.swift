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
          ClockView {
            Image(.latte)
              .resizable()
              .aspectRatio(contentMode: .fill)              
          }
        } label: { 
          Label.init("Latte", systemImage: "clock.fill")
        }
        Tab.init {       
          ClockView {
            MeshGradientView()
              .blur(radius: 1)
          }
        } label: { 
          Label.init("Clock", systemImage: "clock.fill")
        }
        Tab.init {
          Sunset7PM()
            .overlay {
              ClockView {
                MeshGradientView()
                  .blur(radius: 1)
              }
            }
            .ignoresSafeArea()
        } label: {
          Label.init("Sunset", systemImage: "field.of.view.ultrawide.fill")
        }
        Tab.init {
          Sunset8PM()
            .ignoresSafeArea()
        } label: {
          Label.init("Sunset", systemImage: "field.of.view.ultrawide.fill")
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

struct _Tab: View {
  var body: some View {
    TabView {    
      Tab.init {       
        ClockView {
          Image(.latte)
            .resizable()
            .aspectRatio(contentMode: .fill)              
        }
      } label: { 
        Label.init("Latte", systemImage: "clock.fill")
      }
      Tab.init {       
        ClockView {
          MeshGradientView()
            .blur(radius: 1)
        }
      } label: { 
        Label.init("Clock", systemImage: "clock.fill")
      }
      Tab.init {
        Sunset7PM()
          .overlay {
            ClockView {
              MeshGradientView()
                .blur(radius: 1)
            }
          }
          .ignoresSafeArea()
      } label: {
        Label.init("Sunset", systemImage: "field.of.view.ultrawide.fill")
      }
      Tab.init {
        Sunset8PM()
          .ignoresSafeArea()
      } label: {
        Label.init("Sunset", systemImage: "field.of.view.ultrawide.fill")
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

#Preview("BlurryClock") {
  _Tab() 
}
