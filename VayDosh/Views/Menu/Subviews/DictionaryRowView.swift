//
//  DictionaryRowView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 24/09/2025.
//

import SwiftUI

struct DictionaryRowView: View {
  let code: String
  let description: String
  
  var body: some View {
    HStack {
      Text(code)
        .font(.caption)
        .foregroundStyle(.accent)
        .frame(width: 50)
      Divider()
      Text(description)
    }
  }
}
