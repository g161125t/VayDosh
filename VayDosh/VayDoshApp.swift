//
//  VayDoshApp.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import SwiftUI
import CoreData

@main
struct VayDoshApp: App {
  @AppStorage("displayMode") private var displayMode = DisplayMode.system
  
  private let viewContext = PersistenceController.shared.container.viewContext
  private let vm: ViewModel
  
  init() {
    vm = ViewModel(viewContext)
  }
  
  var body: some Scene {
    WindowGroup {
      VayDosh()
        .environment(\.managedObjectContext, viewContext)
        .environmentObject(vm)
        .preferredColorScheme(displayMode.colorScheme)
    }
  }
}
