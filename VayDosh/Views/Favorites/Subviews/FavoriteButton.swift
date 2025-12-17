//
//  FavoriteButton.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI
import CoreData

struct FavoriteButton: View {
  @EnvironmentObject private var vm: ViewModel
  @Environment(\.managedObjectContext) private var viewContext
  
  @ObservedObject var word: DictionaryWord
  
  var body: some View {
    Button {
      withAnimation {
        if word.isFavorite {
          word.isFavorite = false
          word.favoritedDate = nil
        } else {
          word.isFavorite = true
          word.favoritedDate = Date()
        }
        vm.saveContext(viewContext)
      }
    } label: {
      Image(systemName: word.isFavorite ? "star.fill" : "star")
        .foregroundStyle(.yellow)
    }
  }
}
