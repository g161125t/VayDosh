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
  
  @FetchRequest<DictionaryWord>(sortDescriptors: []) private var words
  
  @AppStorage("isFirstLaunch") private var isFirstLaunch = true
  @AppStorage("isSearchingRussian") private var isSearchingRussian = false
  @AppStorage("storedDictionariesCount") private var storedDictionariesCount = 0
  
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
      syncDictionariesIfNeeded()
    }
  }
  
  private var contentView: some View {
    VStack {
      if !vm.searchText.isEmpty && vm.searchText.count > 2 {
        WordsListView()
      } else {
        WelcomeView()
      }
    }
    .searchable(text: $vm.searchText, placement: .navigationBarDrawer(displayMode: .always))
    .autocorrectionDisabled(true)
    .animation(.default, value: vm.searchText)
    .onChange(of: vm.searchText) { _ in
      vm.filterWords(isSearchingRussian, words)
    }
  }
  
  private func syncDictionariesIfNeeded() {
    let currentDictionariesCount = dictionaries.count
    if isFirstLaunch {
      vm.importDataFromJSONToCoreData(viewContext)
      isFirstLaunch = false
      storedDictionariesCount = currentDictionariesCount
    } else if storedDictionariesCount != currentDictionariesCount {
      let newDictionariesCount = currentDictionariesCount - storedDictionariesCount
      vm.importDataFromJSONToCoreData(viewContext, startIndex: currentDictionariesCount - newDictionariesCount)
      storedDictionariesCount = currentDictionariesCount
    }
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  SearchView()
    .environment(\.managedObjectContext, viewContext)
    .environmentObject(ViewModel())
}
