//
//  RandomWordButton.swift
//  VayDosh
//
//  Created by Scottie Illidan on 24/09/2025.
//

import SwiftUI

struct RandomWordButton: View {
  
  @FetchRequest<DictionaryWord>(
    sortDescriptors: [],
    predicate: NSPredicate(format: "dictionary == %@", "КУР05")
  ) private var words
  
  @Binding var showTranslation: Bool
  @Binding var randomWord: DictionaryWord?
  
  var body: some View {
    Button {
      withAnimation {
        if showTranslation {
          showTranslation = false
        }
        randomWord = words.randomElement()
      }
    } label: {
      Text("🎲")
        .font(.largeTitle)
    }
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity, alignment: .trailing)
  }
}
