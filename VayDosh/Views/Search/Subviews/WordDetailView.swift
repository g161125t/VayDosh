//
//  WordDetailView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import SwiftUI
import CoreData

struct WordDetailView: View {
  @EnvironmentObject private var vm: ViewModel
  @Environment(\.managedObjectContext) private var viewContext
  
  @ObservedObject var word: DictionaryWord
  
  @State private var shareWord = false
  @State private var showDictionaries = false
  
  var sharedWord: String {
    "\(word.ingushWord!)\n\(word.russianTranslation!)"
  }
  
  var body: some View {
    List {
      wordDetail
    }
    .safeAreaInset(edge: .bottom) {
      showDictionaryCompositionButton
    }
    .navigationTitle(word.dictionary!)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        shareButton
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        FavoriteButton(word: word)
      }
    }
    .sheet(isPresented: $shareWord) {
      ShareService(text: sharedWord)
    }
    .sheet(isPresented: $showDictionaries) {
      NavigationView {
        DictionaryCompositionView(isInlineTitle: true)
      }
    }
  }
  
  private var wordDetail: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("ING")
          .wordTag()
        Spacer()
        Text(word.partOfSpeech ?? "Part of Speech")
          .wordTag()
      }
      Text(word.ingushWord ?? "Word")
        .wordAnnotation()
      Text("RU")
        .wordTag()
      Text(word.russianTranslation ?? "Translation")
        .wordAnnotation()
      if let terms = word.terms, !terms.isEmpty {
        Divider()
        Text(terms)
          .wordAnnotation()
      }
    }
  }
  
  private var shareButton: some View {
    Button {
      shareWord = true
    } label: {
      Image(systemName: "square.and.arrow.up")
    }
  }
  
  private var showDictionaryCompositionButton: some View {
    Button {
      showDictionaries = true
    } label: {
      Image(systemName: "info.circle")
        .font(.largeTitle)
    }
    .padding(.horizontal)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity, alignment: .trailing)
  }
}


#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  NavigationView {
    WordDetailView(word: .preview(in: viewContext))
      .environment(\.managedObjectContext, viewContext)
      .environmentObject(ViewModel())
  }
}
