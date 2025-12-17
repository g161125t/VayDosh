//
//  WelcomeView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 23/09/2025.
//

import SwiftUI
import CoreData

struct WelcomeView: View {
  
  @State private var randomWord: DictionaryWord?
  @State private var showTranslation = false
  
  var body: some View {
    VStack(spacing: 15) {
      Text(randomWord?.ingushWord ?? "Марш доаг1алда Шо!")
        .font(.title.weight(.bold))
        .multilineTextAlignment(.center)
      ShowTranslationButton(showTranslation: $showTranslation, translation: randomWord?.russianTranslation ?? "Welcome!")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .safeAreaInset(edge: .bottom) {
      RandomWordButton(showTranslation: $showTranslation, randomWord: $randomWord)
    }
    .padding(.horizontal)
  }
}

#Preview {
  let viewContext = PersistenceController.preview.container.viewContext
  WelcomeView()
    .environment(\.managedObjectContext, viewContext)
}
