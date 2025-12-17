//
//  MenuView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct MenuView: View {
  var body: some View {
    NavigationView {
      contentView
        .navigationTitle("Menu")
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            SettingsButton()
          }
        }
    }
    .navigationViewStyle(.stack)
  }
  
  private var contentView: some View {
    List {
      compositionSection
      appearanceSection
      supportSection
    }
  }
  
  private var compositionSection: some View {
    Section {
      NavigationLink {
        DictionaryCompositionView()
      } label: {
        Text("Composition")
      }
    } header: {
      CustomLabel(title: "VayDosh", icon: "books.vertical")
    }
  }
  
  private var appearanceSection: some View {
    Section {
      AppIconPicker()
      DisplayModePicker()
    } header: {
      CustomLabel(title: "Appearance", icon: "paintbrush.pointed")
    }
  }
  
  private var supportSection: some View {
    Section {
      CustomLink(title: "Support", destination: AppLinks.telegram)
      NavigationLink {
        AboutView()
      } label: {
        Text("About")
      }
    } header: {
      CustomLabel(title: "", icon: "info.circle")
    }
  }
}

#Preview {
  MenuView()
}
