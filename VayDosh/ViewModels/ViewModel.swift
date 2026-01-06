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
  private let context: NSManagedObjectContext
  
  init(_ context: NSManagedObjectContext) {
    self.context = context
  }
  
  func filterWords(_ isSearchingRussian: Bool, _ words: FetchedResults<DictionaryWord>) {
    guard !searchText.isEmpty else {
      DispatchQueue.main.async { self.filteredWords = [] }
      return
    }
    
    filterQueue.async { [weak self] in
      guard let self = self else { return }
      
      let languageKey = isSearchingRussian ? "russianTranslation" : "ingushWord"
      
      let beginsWith = NSPredicate(format: "%K BEGINSWITH[cd] %@", languageKey, self.searchText)
      let contains = NSPredicate(format: "%K CONTAINS[cd] %@", languageKey, self.searchText)
      let compound = NSCompoundPredicate(type: .or, subpredicates: [beginsWith, contains])
      
      let filtered = words.filter { compound.evaluate(with: $0) }
      
      let prioritized = filtered.sorted { w1, w2 in
        let w1Starts = beginsWith.evaluate(with: w1)
        let w2Starts = beginsWith.evaluate(with: w2)
        
        if w1Starts != w2Starts {
          return w1Starts
        }
        
        let s1 = (w1.value(forKey: languageKey) as? String) ?? ""
        let s2 = (w2.value(forKey: languageKey) as? String) ?? ""
        
        return s1 < s2
      }
      
      DispatchQueue.main.async {
        self.filteredWords = prioritized
      }
    }
  }
  
  func importDictionaries() async {
    await self.context.perform { [weak self] in
      guard let self = self else { return }
      for dictionary in dictionaries {
        self.processDictionary(dictionary)
      }
    }
  }
  
  private func processDictionary(_ dictionary: DictionaryMeta) {
    let fileExtension = "json"
    guard let fileURL = Bundle.main.url(forResource: dictionary.code, withExtension: fileExtension) else {
      debugPrint("DataSeeder: File not found for code: \(dictionary.code)")
      return
    }
    
    do {
      let data = try Data(contentsOf: fileURL)
      let decoder = JSONDecoder()
      let words = try decoder.decode([WordModel].self, from: data)
      
      self.persist(words: words)
    } catch {
      debugPrint("DataSeeder: Failed to decode \(dictionary.code): \(error.localizedDescription)")
    }
  }
  
  private func persist(words: [WordModel]) {
    for word in words {
      let dictionaryWord = DictionaryWord(context: self.context)
      dictionaryWord.id = UUID()
      dictionaryWord.dictionary = word.dictionary
      dictionaryWord.ingushWord = word.ingushWord
      dictionaryWord.partOfSpeech = word.partOfSpeech
      dictionaryWord.russianTranslation = word.russianTranslation
      dictionaryWord.terms = word.terms
      dictionaryWord.isFavorite = false
      dictionaryWord.favoritedDate = nil
    }
    
    self.saveChanges()
  }
  
  func saveChanges() {
    do {
      try self.context.save()
    } catch {
#if DEBUG
      print("Error in \(#file) \(#function) function: \(error.localizedDescription)")
#endif
    }
  }
}
