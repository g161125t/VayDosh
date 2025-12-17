//
//  DisplayMode.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

enum DisplayMode: Int {
  case system, dark, light
  
  var colorScheme: ColorScheme? {
    switch self {
    case .system: return nil
    case .dark: return ColorScheme.dark
    case .light: return ColorScheme.light
    }
  }
}
