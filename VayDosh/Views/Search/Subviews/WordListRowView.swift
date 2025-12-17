//
//  WordListRowView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import SwiftUI
import CoreData

struct WordListRowView: View {
  
  @AppStorage("isSearchingRussian") private var isSearchingRussian = false
  
  @ObservedObject var word: DictionaryWord
  
  var body: some View {
    HStack {
      wordDetail
      Spacer()
      if word.isFavorite {
        Text("⭐️")
      }
    }
  }
  
  private var wordDetail: some View {
    VStack(alignment: .leading){
      Text(word.dictionary!)
        .font(.caption)
        .foregroundStyle(.secondary)
      Text(isSearchingRussian ? word.russianTranslation! : word.ingushWord!)
        .fontWeight(.bold)
      Text(isSearchingRussian ? word.ingushWord! : word.russianTranslation!)
        .font(.callout)
    }
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  WordListRowView(word: .preview(in: viewContext))
    .environment(\.managedObjectContext, viewContext)
    .environmentObject(ViewModel())
}
