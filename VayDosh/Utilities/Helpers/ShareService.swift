//
//  ShareService.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct ShareService: UIViewControllerRepresentable {
  
  let text: String
  
  func makeUIViewController(context: Context) -> UIActivityViewController {
    return UIActivityViewController(activityItems: [text], applicationActivities: nil)
  }
  
  func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
