//
//  AboutView.swift
//  VayDosh
//
//  Created by Scottie Illidan on 22/09/2025.
//

import SwiftUI

struct AboutView: View {
  
  @State private var shareAppLink = false
  
  private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
  
  var body: some View {
    List {
      appInfoSection
      referenceSection
      graphicMaterialsSection
      privacyPolicySection
    }
    .navigationTitle("About")
    
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Button {
          shareAppLink.toggle()
        } label: {
          Image(systemName: "square.and.arrow.up")
        }
      }
    }
    
    .sheet(isPresented: $shareAppLink) {
      ShareService(text: AppLinks.vaydosh)
    }
  }
  
  private var appInfoSection: some View {
    Section {
      VStack(alignment: .leading) {
        Text("VayDosh")
          .font(.title2.bold())
        if let version = appVersion {
          Text("Version: \(version)")
            .font(.callout)
            .foregroundStyle(.secondary)
        }
      }
    } footer: {
      Text("© 2025 Adam Miziev")
    }
  }
  
  private var referenceSection: some View {
    Section {
      CustomLink(
        title: "GitHub",
        destination: AppLinks.github
      )
      CustomLink(
        title: "Set of Ingush Dictionaries",
        destination: AppLinks.ghalghayGithub
      )
    } header: {
      CustomLabel(title: "Reference", icon: "shippingbox")
    }
  }
  
  private var graphicMaterialsSection: some View {
    Section {
      CustomLink(
        title: "Lottie Animations",
        destination: AppLinks.lottie
      )
      CustomLink(
        title: "Icons made by Freepik from Flaticon",
        destination: AppLinks.flaticon
      )
    } header: {
      CustomLabel(title: "Graphic Materials", icon: "paintpalette")
    }
  }
  
  private var privacyPolicySection: some View {
    Section {
      CustomLink(
        title: "Privacy Policy",
        destination: AppLinks.privacyPolicy
      )
    } header: {
      CustomLabel(title: "", icon: "lock")
    }
  }
}

#Preview {
  NavigationView {
    AboutView()
  }
}
