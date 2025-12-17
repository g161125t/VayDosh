//
//  ShowTranslationButton.swift
//  VayDosh
//
//  Created by Scottie Illidan on 24/09/2025.
//

import SwiftUI

struct ShowTranslationButton: View {
  
  @Binding var showTranslation: Bool
  
  var translation: String
  
  var body: some View {
    ZStack {
      Button {
        withAnimation {
          showTranslation = true
        }
      } label: {
        Text("Show translation")
          .fontWeight(.bold)
          .padding(.horizontal, 20)
      }
      .buttonStyle(.borderedProminent)
      .clipShape(.capsule)
      .opacity(showTranslation ? 0 : 1)
      Text(translation)
        .font(.title2.weight(.light))
        .opacity(showTranslation ? 1 : 0)
        .multilineTextAlignment(.center)
    }
  }
}

struct ShowTranslationButton_Preview: PreviewProvider {
  struct Container: View {
    @State private var showTranslation = false
    var body: some View {
      ShowTranslationButton(showTranslation: $showTranslation, translation: "Welcome!")
    }
  }
  
  static var previews: some View {
    Container()
  }
}
