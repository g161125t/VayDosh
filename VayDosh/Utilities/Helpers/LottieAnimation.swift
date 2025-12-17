//
//  LottieAnimation.swift
//  VayDosh
//
//  Created by Scottie Illidan on 27/09/2025.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

  var loopMode: LottieLoopMode = .loop
  var animationName: String
  
  func makeUIView(context: Context) -> Lottie.LottieAnimationView {
    let animationView = LottieAnimationView(name: animationName)
    animationView.play()
    animationView.loopMode = loopMode
    animationView.contentMode = .scaleAspectFit
    return animationView
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {}
}
