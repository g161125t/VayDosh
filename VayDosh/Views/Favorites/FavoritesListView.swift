//
//  FavoritesListView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI
import CoreData

struct FavoritesListView: View {
  
  @EnvironmentObject private var vm: ViewModel
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest<DictionaryWord>(
    sortDescriptors: [SortDescriptor(\DictionaryWord.favoritedDate, order: .forward)],
    predicate: NSPredicate(format: "isFavorite == true")
  ) private var words
  
  var body: some View {
    NavigationView {
      contentView
        .navigationTitle("Favorites")
    }
    .navigationViewStyle(.stack)
  }
  
  private var contentView: some View {
    Group {
      if words.isEmpty {
        EmptyFavoritesView()
      } else {
        favorites
      }
    }
  }
  
  private var favorites: some View {
    List(words) { word in
      FavoritesListRowView(word: word)
    }
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  FavoritesListView()
    .environment(\.managedObjectContext, viewContext)
    .environmentObject(ViewModel())
}
