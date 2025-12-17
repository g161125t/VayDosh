//
//  Persistence.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
  
  @MainActor
  static let preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    
    let sampleWords = [
      ("Дошлорг", "Словарь", "КУР05", "", ""),
      ("А́кхадаьнна", "Одичалый", "КУР05", "", ""),
      ("Хаза", "Прослышать", "КОД21", "", "")
    ]
    
    for (russianTranslation, ingushWord, dictionary, partOfSpeech, terms) in sampleWords {
      let word = DictionaryWord(context: viewContext)
      word.id = UUID()
      word.ingushWord = ingushWord
      word.russianTranslation = russianTranslation
      word.dictionary = dictionary
      word.partOfSpeech = partOfSpeech
      word.terms = terms
      word.isFavorite = true
      word.favoritedDate = Date()
    }
    
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
#if DEBUG
      print("Unresolved error \(nsError), \(nsError.userInfo)")
#endif
    }
    return result
  }()
  
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "VayDosh")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
#if DEBUG
        print("Unresolved error \(error), \(error.userInfo)")
#endif
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
}
