//
//  ContentView.swift
//  BlurryClock
//
//  Created by Muukii on 2025/05/27.
//

import HexColorMacro
import SwiftUI

extension Color {
  static let neuBackground = #hexColor("f0f0f3")
  static let dropShadow = #hexColor("aeaec0").opacity(0.4)
  static let dropLight = #hexColor("ffffff")
}

extension Color {

  public init(
    light: @autoclosure @escaping () -> Color,
    dark: @autoclosure @escaping () -> Color
  ) {
    let uiColor = UIColor.init { trait in
      switch trait.userInterfaceStyle {
      case .light:
        return UIColor(light())
      case .dark:
        return UIColor(dark())
      case .unspecified:
        return UIColor(light())
      @unknown default:
        return UIColor(light())
      }
    }

    self.init(uiColor: uiColor)
  }
}

struct Theme {

  static let adaptive = Theme(
    light: .basic,
    dark: .dark
  )

  static let basic = Theme(
    backgroundColor: #hexColor("F3F0F1"),
    frameColor: #hexColor("D9D9D9"),
    hourHand: #hexColor("2A1C1B"),
    minuteHand: #hexColor("2A1C1B"),
    secondsHand: #hexColor("97C2D6")
  )

  static let dark = Theme(
    backgroundColor: #hexColor("000000"),
    frameColor: #hexColor("333333"),
    hourHand: #hexColor("FFFFFF"),
    minuteHand: #hexColor("FFFFFF"),
    secondsHand: #hexColor("FF4081")
  )

  let backgroundColor: Color
  let frameColor: Color
  let hourHand: Color
  let minuteHand: Color
  let secondsHand: Color

  init(
    backgroundColor: Color,
    frameColor: Color,
    hourHand: Color,
    minuteHand: Color,
    secondsHand: Color
  ) {
    self.backgroundColor = backgroundColor
    self.frameColor = frameColor
    self.hourHand = hourHand
    self.minuteHand = minuteHand
    self.secondsHand = secondsHand
  }

  init(
    light: Theme,
    dark: Theme
  ) {
    self.backgroundColor = Color(
      light: light.backgroundColor,
      dark: dark.backgroundColor
    )
    self.frameColor = Color(
      light: light.frameColor,
      dark: dark.frameColor
    )
    self.hourHand = Color(
      light: light.hourHand,
      dark: dark.hourHand
    )
    self.minuteHand = Color(
      light: light.minuteHand,
      dark: dark.minuteHand
    )
    self.secondsHand = Color(
      light: light.secondsHand,
      dark: dark.secondsHand
    )
  }
}

struct ClockView<SecondsHandView: View>: View {
  
  private let theme: Theme
  private let secondsHandView: () -> SecondsHandView
  
  init(
    theme: Theme = .adaptive,
    @ViewBuilder secondsHandView: @escaping () -> SecondsHandView
  ) {
    self.theme = theme
    self.secondsHandView = secondsHandView
  }
  
  var body: some View {
    ZStack {
      theme.backgroundColor
        .ignoresSafeArea()
      ScaledView(
        baseSize: .init(width: 300, height: 300)
      ) {
        ContentView(
          theme: theme,
          secondsHandView: secondsHandView
        )
          .padding(120)
      }
    }
  }
}

struct ContentView<SecondsHandView: View>: View {

  let theme: Theme
  let secondsHandView: () -> SecondsHandView

  init(theme: Theme, @ViewBuilder secondsHandView: @escaping () -> SecondsHandView) {
    self.theme = theme
    self.secondsHandView = secondsHandView
  }

  var body: some View {

    ZStack {
      Circle()
        .foregroundStyle(theme.frameColor)
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
                        .foregroundStyle(theme.hourHand)
                        .frame(width: 30, height: nil)
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
                        .foregroundStyle(theme.minuteHand)
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
                  .overlay(
                    alignment: .top,
                    content: {
                      secondsHandView()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .rotationEffect(.degrees(-Self.secondAngle(date: currentTime)))
                    })
                Rectangle()
                  .foregroundStyle(Color.clear)
              }
              .rotationEffect(.degrees(Self.secondAngle(date: currentTime)))
//              .blur(radius: 2)
            }
          }
          .padding(16)
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

struct MeshGradientView: View {
  
  struct GeneratedGradient: View {
    private let width: Int = 3
    private let height: Int = 3
    private let points: [SIMD2<Float>] = 
    [
      SIMD2<Float>(0.0, 0.0),
      SIMD2<Float>(0.5, 0.0),
      SIMD2<Float>(1.0, 0.0),
      SIMD2<Float>(0.0, 1.0),
      SIMD2<Float>(0.4925312, 0.8231666),
      SIMD2<Float>(1.0, 0.60882413),
      SIMD2<Float>(0.0, 1.0),
      SIMD2<Float>(0.61209226, 1.0),
      SIMD2<Float>(1.0, 1.0)
    ]
    private let colors: [Color] = 
    [
      Color(red: 1, green: 0.527, blue: 0.084),
      Color(red: 0.919, green: 0.741, blue: 0.641),
      Color(red: 1, green: 0.271, blue: 0.227),
      Color(red: 0.885, green: 0.665, blue: -0.224),
      Color(red: 1, green: 0.271, blue: 0.227),
      Color(red: 0.611, green: 0.326, blue: 0.221),
      Color(red: 0.952, green: 0.467, blue: 0.226),
      Color(red: 0.996, green: 0.351, blue: -0.151),
      Color(red: 0.458, green: 0.073, blue: 0.135)
    ]
    private let background: Color = Color(red: 1, green: 1, blue: 1)
    private let smoothsColors: Bool = true
    private let colorSpace: Gradient.ColorSpace = .device
    
    var body: some View {
      MeshGradient(
        width: width,
        height: height,
        points: points,
        colors: colors,
        background: background,
        smoothsColors: smoothsColors,
        colorSpace: colorSpace
      )
    }
  }
  
  var body: some View {
    GeneratedGradient()          
  }
}

#Preview {
  MeshGradientView()
    .frame(width: 200, height: 200)
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

        let scale = min(
          proxy.size.width / baseSize.width,
          proxy.size.height / baseSize.height
        )

        content
          .frame(
            width: baseSize.width,
            height: baseSize.height
          )
          .scaleEffect(
            x: scale,
            y: scale,
            anchor: .center
          )
          .aspectRatio(1, contentMode: .fit)
          .frame(alignment: .center)
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      })

  }

}

#Preview {
  TabView {    
    Tab.init {       
      ClockView {
        Image(.latte)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .clipShape(Circle())
      }
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
}
