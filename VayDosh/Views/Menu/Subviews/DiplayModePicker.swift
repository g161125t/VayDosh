//
//  DiplayModePicker.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct DisplayModePicker: View {
  
  @AppStorage("displayMode") private var displayMode = DisplayMode.system
  
  var body: some View {
    HStack {
      Text("Color scheme:")
      Spacer()
      DisplayModePicker()
    }
  }
  
  private func DisplayModePicker() -> some View {
    Picker("", selection: $displayMode) {
      Text("Auto")
        .tag(DisplayMode.system)
      Text("Dark")
        .tag(DisplayMode.dark)
      Text("Light")
        .tag(DisplayMode.light)
    }
    .pickerStyle(.segmented)
  }
}

#Preview {
  NavigationView {
    List {
      DisplayModePicker()
    }
    .navigationTitle("Display Mode Picker")
  }
}
