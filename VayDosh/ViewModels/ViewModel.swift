//
//  ViewModel.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import Combine
import CoreData
import SwiftUI

final class ViewModel: ObservableObject {
  
  @Published var filteredWords: [DictionaryWord] = []
  @Published var searchText = ""
  
  private let filterQueue = DispatchQueue(label: "FilterQueue", qos: .userInitiated)
  
  func filterWords(_ isSearchingRussian: Bool, _ words: FetchedResults<DictionaryWord>) {
    if !searchText.isEmpty && searchText.count > 2 {
      filterQueue.async {
        let languageKey = isSearchingRussian ? "russianTranslation" : "ingushWord"
        let beginsWithPredicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", languageKey, self.searchText)
        let containsPredicate = NSPredicate(format: "%K CONTAINS[cd] %@", languageKey, self.searchText)
        let compoundPredicate = NSCompoundPredicate(type: .or, subpredicates: [beginsWithPredicate, containsPredicate])
        
        let filtered = words.filter { compoundPredicate.evaluate(with: $0) }
        
        let prioritized = filtered.sorted { word_1, word_2 in
          let word_1_BeginsWith = beginsWithPredicate.evaluate(with: word_1)
          let word_2_BeginsWith = beginsWithPredicate.evaluate(with: word_2)
          
          if word_1_BeginsWith && !word_2_BeginsWith {
            return true
          } else if !word_1_BeginsWith && word_2_BeginsWith {
            return false
          } else {
            let string_1 = word_1.value(forKey: languageKey) as? String ?? ""
            let string_2 = word_2.value(forKey: languageKey) as? String ?? ""
            return string_1 < string_2
          }
        }
        
        DispatchQueue.main.async {
          self.filteredWords = prioritized
        }
      }
    } else {
      DispatchQueue.main.async {
        self.filteredWords = []
      }
    }
  }
  
  func importDataFromJSONToCoreData(_ context: NSManagedObjectContext, startIndex: Int = 0) {
    let fileExtension = "json"
    let decoder = JSONDecoder()
    
    for dictionary in dictionaries[startIndex...] {
      guard let fileURL = Bundle.main.url(forResource: dictionary.code, withExtension: fileExtension) else {
#if DEBUG
        print("Couldn't find \(dictionary.code) in main bundle.")
#endif
        return
      }
      
      do {
        let data = try Data(contentsOf: fileURL)
        let words = try decoder.decode([WordModel].self, from: data)
        
        self.saveDataToCoreData(words, context)
      } catch {
#if DEBUG
        print("Couldn't load \(dictionary.code) from main bundle: \(error)")
#endif
      }
    }
  }
  
  private func saveDataToCoreData(_ words: [WordModel], _ context: NSManagedObjectContext) {
    for word in words {
      let dictionaryWord = DictionaryWord(context: context)
      dictionaryWord.id = UUID()
      dictionaryWord.dictionary = word.dictionary
      dictionaryWord.ingushWord = word.ingushWord
      dictionaryWord.partOfSpeech = word.partOfSpeech
      dictionaryWord.russianTranslation = word.russianTranslation
      dictionaryWord.terms = word.terms
      dictionaryWord.isFavorite = false
      dictionaryWord.favoritedDate = nil
    }
    
    self.saveContext(context)
  }
  
  func saveContext(_ context: NSManagedObjectContext) {
    do {
      try context.save()
    } catch {
#if DEBUG
      print("Error in \(#file) \(#function) function: \(error.localizedDescription)")
#endif
    }
  }
}
