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

#Preview("Color") {
  _Book()
}
