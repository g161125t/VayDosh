//
//  SearchView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import SwiftUI
import CoreData

struct SearchView: View {
  @EnvironmentObject private var vm: ViewModel
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest<DictionaryWord>(
    sortDescriptors: [
      NSSortDescriptor(
        keyPath: \DictionaryWord.ingushWord,
        ascending: true
      )
    ]
  ) private var ingushWords

  @FetchRequest<DictionaryWord>(
    sortDescriptors: [
      NSSortDescriptor(
        keyPath: \DictionaryWord.russianTranslation,
        ascending: true
      )
    ]
  ) private var russianTranslations
  
  @AppStorage("isFirstLaunch") private var isFirstLaunch = true
  @AppStorage("isSearchingRussian") private var isSearchingRussian = false
  
  var body: some View {
    NavigationView {
      contentView
        .navigationTitle("VayDosh")
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            LanguageToggle(isSearchingRussian: $isSearchingRussian)
          }
        }
    }
    .navigationViewStyle(.stack)
    .onAppear {
      if isFirstLaunch {
        Task {
          await vm.importDictionaries()
          isFirstLaunch = false
        }
      }
    }
  }
  
  private var contentView: some View {
    VStack {
      if !vm.searchText.isEmpty {
        WordsListView()
      } else {
        WelcomeView()
      }
    }
    .onChange(of: vm.searchText) { new in
      vm.filterWords(isSearchingRussian, isSearchingRussian ? russianTranslations : ingushWords)
    }
    .searchable(text: $vm.searchText, placement: .navigationBarDrawer(displayMode: .always))
    .autocorrectionDisabled(false)
    .animation(.default, value: vm.searchText)
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  SearchView()
    .environment(\.managedObjectContext, viewContext)
    .environmentObject(ViewModel(viewContext))
}
