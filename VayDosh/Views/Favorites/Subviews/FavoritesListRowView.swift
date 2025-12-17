//
//  FavoritesListRowView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 01/10/2025.
//

import SwiftUI
import CoreData

struct FavoritesListRowView: View {
  @ObservedObject var word: DictionaryWord
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(alignment: .top) {
        Text("Dictionary: \(word.dictionary!)")
        Spacer()
        FavoriteButton(word: word)
      }
      Text(word.ingushWord!)
      Text(word.russianTranslation!)
    }
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  FavoritesListRowView(word: .preview(in: viewContext))
    .environment(\.managedObjectContext, viewContext)
}
