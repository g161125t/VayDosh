//
//  WordModel.swift
//  VayDosh
//
//  Created by Scottie Illidan on 21/09/2025.
//

import Foundation

struct WordModel: Decodable {
  var dictionary: String
  var ingushWord: String
  var partOfSpeech: String
  var russianTranslation: String
  var terms: String
}
