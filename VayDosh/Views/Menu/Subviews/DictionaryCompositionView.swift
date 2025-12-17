//
//  DictionaryCompositionView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct DictionaryCompositionView: View {
  var isInlineTitle = false
  var body: some View {
    List {
      Section {
        ForEach(dictionaries) { dictionary in
          DictionaryRowView(code: dictionary.code, description: dictionary.description)
        }
      } header: {
        DictionarySectionHeaderView()
      }
    }
    .navigationTitle("Composition")
    .navigationBarTitleDisplayMode(isInlineTitle ? .inline : .large)
  }
}

#Preview {
  NavigationView {
    DictionaryCompositionView()
  }
}
