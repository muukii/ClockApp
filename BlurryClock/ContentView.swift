//
//  ContentView.swift
//  BlurryClock
//
//  Created by Muukii on 2025/05/27.
//

import SwiftUI
import HexColorMacro

extension Color {
  static let neuBackground = #hexColor("f0f0f3")
  static let dropShadow = #hexColor("aeaec0").opacity(0.4)
  static let dropLight = #hexColor("ffffff")
}

extension UIColor {
  
  public convenience init(
    light: @autoclosure @escaping () -> UIColor,
    dark: @autoclosure @escaping () -> UIColor
  ) {
    self.init { trait in
      switch trait.userInterfaceStyle {
      case .light:
        return light()
      case .dark:
        return dark()
      case .unspecified:
        return light()
      @unknown default:
        return light()
      }
    }
  }
  
}

struct ContentView: View {
    
  var body: some View {
        
    ZStack {
      Circle()
        .background {
          Circle()
//            .shadow(
//              color: .dropShadow,
//              radius: 20,
//              x: 10,
//              y: 10
//            )
//            .shadow(
//              color: .dropLight,
//              radius: 20,
//              x: -10,
//              y: -10
//            )
//            .blur(radius: 3)
            .blendMode(.overlay)
        }       
        .foregroundStyle(#hexColor("F3F0F1"))
        .overlay {
          TimelineView(.animation) { _ in 
            let currentTime = Date()
            ZStack {
              
              // hour hand
              VStack(spacing: 0) {
                Rectangle()
                  .foregroundStyle(Color.clear)
                  .overlay(
                    alignment: .top,
                    content: {                
                      RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(#hexColor("2A1C1B"))                    .frame(width: 30, height: nil)                  
                        .padding(.bottom, 90)
                    })
                Rectangle()
                  .foregroundStyle(Color.clear)
              }
              .rotationEffect(.degrees(Self.hourAngle(date: currentTime)))
              .blur(radius: 4)
                           
              // Minute hand
              VStack(spacing: 0) {
                Rectangle()
                  .foregroundStyle(Color.clear)
                  .overlay(
                    alignment: .top,
                    content: {                
                      RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(#hexColor("2A1C1B"))
                        .frame(width: 30, height: nil)
                    })
                Rectangle()
                  .foregroundStyle(Color.clear)
              }
              .rotationEffect(.degrees(Self.minuteAngle(date: currentTime)))
              .blur(radius: 3)
              
              // Seconds
              VStack(spacing: 0) {
                Rectangle()
                  .foregroundStyle(Color.clear)
                  .overlay(alignment: .top, content: {                
                    Circle()
                      .foregroundStyle(#hexColor("E76050"))
                      .frame(width: 60, height: 60)
                  })
                Rectangle()
                  .foregroundStyle(Color.clear)
              }
              .rotationEffect(.degrees(Self.secondAngle(date: currentTime)))   
              .blur(radius: 2)
            }
          }
          .padding(20)
        }
    }
    .aspectRatio(1, contentMode: .fit)
    .frame(width: 300, height: 300)
      
  }
  
  private static func hourAngle(date: Date) -> Double {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    return Double(hour % 12) * 30 + Double(minute) * 0.5
  }
  
  private static func minuteAngle(date: Date) -> Double {
    let calendar = Calendar.current
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)
    return Double(minute) * 6 + Double(second) * 0.1
  }
  
  private static func secondAngle(date: Date) -> Double {
    let calendar = Calendar.current
    let second = calendar.component(.second, from: date)
    let nanosecond = calendar.component(.nanosecond, from: date)  
    let fractionalSecond = Double(nanosecond) / 1_000_000_000.0  
    return (Double(second) + fractionalSecond) * 6
  }
}

struct ScaledView<Content: View>: View {
  
  let content: Content
  let baseSize: CGSize
  
  init(
    baseSize: CGSize,
    @ViewBuilder content: () -> Content
  ) {
    self.baseSize = baseSize
    self.content = content()
  }
  
  var body: some View {
    
    GeometryReader(
      content: { proxy in         
        content
          .frame(
            width: baseSize.width,
            height: baseSize.height
          )
          .scaleEffect(
            x: proxy.size.height / baseSize.height,
            y: proxy.size.height / baseSize.height,         
            anchor: .center
          )
          .aspectRatio(1, contentMode: .fit)
          .frame(alignment: .center)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    })
    
  }
  
}

#Preview {
  ZStack {
    #hexColor("D9D9D9")
      .ignoresSafeArea()
    ScaledView(baseSize: .init(width: 300, height: 300)) {       
      ContentView()    
        .padding(20)
    }
  }
}
