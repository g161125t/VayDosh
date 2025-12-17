//
//  TextExtension.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import SwiftUI

extension Text {
  func wordTag() -> some View {
    self
      .font(.footnote.weight(.black))
      .foregroundStyle(.accent)
  }
  
  func wordAnnotation() -> some View {
    self
      .font(.title2)
      .textSelection(.enabled)
  }
  
  func customNavigationTitle() -> some View {
    self
      .font(.largeTitle)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}
