//
//  EmptySearchView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 27/09/2025.
//

import SwiftUI
import Lottie

struct EmptySearchView: View {
  @EnvironmentObject private var vm: ViewModel
  
  var body: some View {
    VStack {
      animation
      Text("No Results")
        .font(.title2.weight(.bold))
      message
    }
    .multilineTextAlignment(.center)
    .padding()
  }
  
  private var animation: some View {
    LottieView(animationName: "empty")
      .frame(width: 150, height: 100)
      .scaleEffect(0.5)
      .padding(.vertical)
  }
  
  private var message: some View {
    VStack(spacing: 4) {
      Text("There were no results for")
      Text("\"\(vm.searchText)\".")
        .fontWeight(.semibold)
      Text("Try a new search.")
    }
    .font(.subheadline)
    .foregroundStyle(.secondary)
  }
}
