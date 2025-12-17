//
//  AppIcon.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import Foundation

enum AppIcon: String, CaseIterable, Identifiable {
  case standard = "AppIcon"
  case dark = "AppIcon-Dark"
  case light = "AppIcon-Light"
  case ingushFlag = "AppIcon-IngushFlag"
  case gradient = "AppIcon-Gradient"
  
  var id: String { rawValue }
  
  var displayName: String {
    switch self {
    case .standard: return "Jeirah"
    case .dark: return "Dark"
    case .light: return "Light"
    case .ingushFlag: return "Ingush Flag"
    case .gradient: return "Gradient"
    }
  }
}
