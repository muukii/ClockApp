//
//  Book.swift
//  BlurryClock
//
//  Created by Muukii on 2025/05/27.
//

import SwiftUI

private struct _Book: View {
  @Environment(\.colorScheme) private var colorScheme
  
  var body: some View {
    Text("Hello")
      .onChange(of: colorScheme) { newValue in print("Color scheme changed to \(newValue)")}
  }
}

#Preview {
  struct GeneratedGradient: View {
    private let width: Int = 3
    private let height: Int = 3
    private let points: [SIMD2<Float>] = 
    [
      SIMD2<Float>(0.0, 0.0),
      SIMD2<Float>(0.5, 0.0),
      SIMD2<Float>(1.0, 0.0),
      SIMD2<Float>(0.0, 0.7407372),
      SIMD2<Float>(0.49581313, 0.54369396),
      SIMD2<Float>(1.0, 0.7684086),
      SIMD2<Float>(0.0, 1.0),
      SIMD2<Float>(0.5, 1.0),
      SIMD2<Float>(1.0, 1.0)
    ]
    private let colors: [Color] = 
    [
      Color(red: 0.256, green: 0.271, blue: 0.448),
      Color(red: 0.256, green: 0.271, blue: 0.448),
      Color(red: 0.256, green: 0.271, blue: 0.448),
      Color(red: 0.550, green: 0.348, blue: 0.452),
      Color(red: 0.951, green: 0.476, blue: 0.343),
      Color(red: 0.550, green: 0.348, blue: 0.452),
      Color(red: 0.781, green: 0.151, blue: 0.106),
      Color(red: 0.895, green: 0.189, blue: 0.131),
      Color(red: 0.781, green: 0.151, blue: 0.106)
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
  return GeneratedGradient()
}

struct Sunset7PM: View {
  private let width: Int = 3
  private let height: Int = 3
  private let points: [SIMD2<Float>] = 
  [
    SIMD2<Float>(0.0, 0.0),
    SIMD2<Float>(0.5, 0.0),
    SIMD2<Float>(1.0, 0.0),
    SIMD2<Float>(0.0, 0.7407372),
    SIMD2<Float>(0.49581313, 0.54369396),
    SIMD2<Float>(1.0, 0.7684086),
    SIMD2<Float>(0.0, 1.0),
    SIMD2<Float>(0.5, 1.0),
    SIMD2<Float>(1.0, 1.0)
  ]
  private let colors: [Color] = 
  [
    Color(red: 0.256, green: 0.271, blue: 0.448),
    Color(red: 0.256, green: 0.271, blue: 0.448),
    Color(red: 0.256, green: 0.271, blue: 0.448),
    Color(red: 0.550, green: 0.348, blue: 0.452),
    Color(red: 0.951, green: 0.476, blue: 0.343),
    Color(red: 0.550, green: 0.348, blue: 0.452),
    Color(red: 0.781, green: 0.151, blue: 0.106),
    Color(red: 0.895, green: 0.189, blue: 0.131),
    Color(red: 0.781, green: 0.151, blue: 0.106)
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

struct Sunset8PM: View {
  private let width: Int = 3
  private let height: Int = 3
  private let points: [SIMD2<Float>] = 
  [
    SIMD2<Float>(0.0, 0.0),
    SIMD2<Float>(0.50022125, 0.0),
    SIMD2<Float>(1.0, 0.0),
    SIMD2<Float>(0.0, 0.57552564),
    SIMD2<Float>(0.50394714, 0.4676853),
    SIMD2<Float>(1.0, 0.5715084),
    SIMD2<Float>(0.0, 1.0),
    SIMD2<Float>(0.5017907, 1.0),
    SIMD2<Float>(1.0, 1.0)
  ]
  private let colors: [Color] = 
  [
    Color(red: 0.030, green: 0.083, blue: 0.203),
    Color(red: 0.030, green: 0.083, blue: 0.203),
    Color(red: 0.030, green: 0.083, blue: 0.203),
    Color(red: 0.071, green: 0.226, blue: 0.354),
    Color(red: 0.118, green: 0.282, blue: 0.404),
    Color(red: 0.071, green: 0.226, blue: 0.354),
    Color(red: 0.112, green: 0.270, blue: 0.328),
    Color(red: 0.130, green: 0.426, blue: 0.507),
    Color(red: 0.112, green: 0.270, blue: 0.328)
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

#Preview {
  struct GeneratedGradient: View {
    private let width: Int = 3
    private let height: Int = 3
    private let points: [SIMD2<Float>] = 
    [
      SIMD2<Float>(0.0, 0.0),
      SIMD2<Float>(0.50022125, 0.0),
      SIMD2<Float>(1.0, 0.0),
      SIMD2<Float>(0.0, 0.57552564),
      SIMD2<Float>(0.50394714, 0.4676853),
      SIMD2<Float>(0.99967504, 0.5715084),
      SIMD2<Float>(0.0, 1.0),
      SIMD2<Float>(0.5017907, 1.0),
      SIMD2<Float>(1.0, 1.0)
    ]
    private let colors: [Color] = 
    [
      Color(red: 0.030, green: 0.083, blue: 0.203),
      Color(red: 0.030, green: 0.083, blue: 0.203),
      Color(red: 0.030, green: 0.083, blue: 0.203),
      Color(red: 0.071, green: 0.226, blue: 0.354),
      Color(red: 0.118, green: 0.282, blue: 0.404),
      Color(red: 0.071, green: 0.226, blue: 0.354),
      Color(red: 0.112, green: 0.270, blue: 0.328),
      Color(red: 0.130, green: 0.426, blue: 0.507),
      Color(red: 0.112, green: 0.270, blue: 0.328)
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
  return Sunset8PM()
}

#Preview("Color") {
  _Book()
}

import SwiftUI

struct GradientView: View {
  var body: some View {
    Rectangle()
      .fill(
        LinearGradient(
          gradient: Gradient(stops: [
            .init(color: Color(red: 0.85, green: 0.95, blue: 1.0), location: 0.0),   // 淡い水色
            .init(color: Color(red: 0.80, green: 0.9, blue: 1.0), location: 0.4),   // 少し濃い水色
            .init(color: Color(red: 1.0, green: 0.6, blue: 0.55), location: 0.6),   // 赤オレンジ
            .init(color: Color(red: 1.0, green: 0.4, blue: 0.4), location: 0.8),   // さらに濃い赤
            .init(color: Color.white, location: 1.0)                              // 白でフェードアウト
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .padding(-20)
      .blur(radius: 10)
      .ignoresSafeArea()
  }
}

#Preview {
  GradientView()
}
