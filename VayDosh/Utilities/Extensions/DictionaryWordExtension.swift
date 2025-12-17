//
//  DictionaryWordExtension.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

#if DEBUG
import SwiftUI
import CoreData

extension DictionaryWord {
  static func preview(in context: NSManagedObjectContext) -> DictionaryWord {
    let word = DictionaryWord(context: context)
    word.id = UUID()
    word.ingushWord = "Дошлорг"
    word.russianTranslation = "Словарь"
    word.dictionary = "КОД21"
    word.partOfSpeech = "Сущ."
    word.terms = "Термин"
    word.isFavorite = true
    word.favoritedDate = Date()
    return word
  }
}
#endif // DEBUG
