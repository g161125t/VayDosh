//
//  CustomLink.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct CustomLink: View {
  
  var title: String
  var destination: String
  
  var body: some View {
    Link(destination: URL(string: destination)!) {
      CustomLinkLabel()
    }
    .foregroundStyle(.primary)
  }
  
  private func CustomLinkLabel() -> some View {
    HStack {
      Text(title)
      Spacer()
      Image(systemName: "link")
        .font(.footnote.bold())
        .padding(.trailing, -3)
        .foregroundStyle(.secondary.opacity(0.6))
    }
  }
  
}

#Preview {
  CustomLink(title: "Apple", destination: "https://www.apple.com")
}
