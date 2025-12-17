//
//  VayDosh.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI
import CoreData

struct VayDosh: View {
  @State private var selectedTab: Tab = .search
  
  enum Tab {
    case search
    case favorites
    case menu
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
      SearchView()
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
        .tag(Tab.search)
      
      FavoritesListView()
        .tabItem {
          Label("Favorites", systemImage: "star")
            .environment(\.symbolVariants, .none)
        }
        .tag(Tab.favorites)
      
      MenuView()
        .tabItem {
          Label("Menu", systemImage: "list.bullet")
        }
        .tag(Tab.menu)
    }
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  VayDosh()
    .environment(\.managedObjectContext, viewContext)
}
