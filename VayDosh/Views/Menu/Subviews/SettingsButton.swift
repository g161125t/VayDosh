//
//  SettingsButton.swift
//  VayDosh
//
//  Created by Scottie Illidan on 13/10/2025.
//

import SwiftUI

struct SettingsButton: View {
  var body: some View {
    Button {
      if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(appSettingsURL)
      }
    } label: {
      Image(systemName: "gear")
        .font(.title2)
    }
    .foregroundStyle(.primary)
  }
}

#Preview {
  SettingsButton()
}
