//
//  WordsListView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 30/09/2025.
//

import SwiftUI

struct WordsListView: View {
  @EnvironmentObject private var vm: ViewModel
  
  var body: some View {
    if vm.filteredWords.isEmpty {
      EmptySearchView()
    } else {
      wordsList
    }
  }
  
  var wordsList: some View {
    List(vm.filteredWords.prefix(30)) { word in
      NavigationLink {
        WordDetailView(word: word)
      } label: {
        WordListRowView(word: word)
      }
    }
    .animation(.default, value: vm.filteredWords)
  }
}
