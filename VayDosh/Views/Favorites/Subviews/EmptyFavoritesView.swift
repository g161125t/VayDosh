//
//  EmptyFavoritesView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 27/09/2025.
//

import SwiftUI
import Lottie

struct EmptyFavoritesView: View {
  var body: some View {
    VStack {
      animation
      message
    }
    .multilineTextAlignment(.center)
    .padding()
  }
  
  private var animation: some View {
    ZStack {
      LottieView(loopMode: .playOnce, animationName: "gold-star")
        .frame(width: 150, height: 150)
      LottieView(animationName: "shining-stars")
        .frame(height: 150)
    }
  }
  
  private var message: some View {
    Group {
      Text("No Favorites yet")
        .font(.title2.weight(.bold))
      Text("Add words using ⭐️")
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
  }
}

#Preview {
  EmptyFavoritesView()
}
