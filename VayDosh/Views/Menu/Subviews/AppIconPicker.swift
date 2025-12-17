//
//  AppIconPicker.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct AppIconPicker: View {
  @AppStorage("activeAppIcon") private var activeAppIcon = "AppIcon"
  
  var body: some View {
    HStack {
      Text("Icon:")
      Spacer()
      Picker("", selection: $activeAppIcon) {
        ForEach(AppIcon.allCases) { icon in
          Text(icon.displayName)
            .tag(icon.rawValue)
        }
      }
      .pickerStyle(.menu)
    }
    .onChange(of: activeAppIcon) { newIcon in
      if(newIcon == "AppIcon") {
        UIApplication.shared.setAlternateIconName(nil)
      } else {
        UIApplication.shared.setAlternateIconName(newIcon)
      }
    }
  }
}

#Preview {
  NavigationView {
    List {
      AppIconPicker()
    }
    .navigationTitle("App Icon")
  }
}
