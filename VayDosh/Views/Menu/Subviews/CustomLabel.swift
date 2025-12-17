//
//  CustomLabel.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct CustomLabel: View {
  
  var title: String
  var icon: String
  
  var body: some View {
    Label {
      Text(title)
    } icon: {
      Image(systemName: icon)
        .font(.title2)
        .foregroundStyle(.accent)
    }
  }
}

#Preview {
  CustomLabel(title: "Title", icon: "house")
}
