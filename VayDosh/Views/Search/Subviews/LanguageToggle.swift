//
//  SearchLanguageToggle.swift
//  VayDosh
//
//  Created by Scottie Illidan on 24/09/2025.
//

import SwiftUI

struct LanguageToggle: View {
  
  @Binding var isSearchingRussian: Bool
  
  var body: some View {
    Button {
      isSearchingRussian.toggle()
    } label: {
      label
    }
  }
  
  private func languageText(_ text: String, color: Color) -> some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.bold)
      .foregroundStyle(color)
      .frame(width: 35)
  }
  
  private var label: some View {
    HStack(spacing: 5) {
      languageText(
        isSearchingRussian ? "RU" : "ING",
        color: isSearchingRussian ? .red : .accent
      )
      
      Image(isSearchingRussian ? "RUING" : "INGRU")
        .resizable()
        .aspectRatio(contentMode: .fit)
      languageText(
        isSearchingRussian ? "ING" : "RU",
        color: isSearchingRussian ? .accent : .red
      )
    }
  }
}

struct LanguageToggle_Preview: PreviewProvider {
  struct Container: View {
    @State private var isSearchingRussian = false
    var body: some View {
      LanguageToggle(isSearchingRussian: $isSearchingRussian)
    }
  }
  
  static var previews: some View {
    Container()
  }
}
