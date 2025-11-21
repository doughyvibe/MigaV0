//
//  ContentView.swift
//  MigaV0
//
//  Created by Doughy on 21/11/25.
//

import SwiftUI

// B-002: Create MindfulnessQuote struct - core data model for quotes with id, text, tags, category
// Used for developing a structured model for mindfulness quotes enabling organization and retrieval
struct MindfulnessQuote: Identifiable {
    let id: UUID
    let text: String        // The actual quote content
    let tags: [String]      // Categories like "Stoicism", "Poetry", "Focus"
    let category: String    // Primary category for easier filtering

    init(text: String, tags: [String], category: String) {
        self.id = UUID()
        self.text = text
        self.tags = tags
        self.category = category
    }
}

// B-002: Debug logging rule - explicitly documenting rule application and purpose for clarity
// Rule: "Always add debug logs & comments in the code for easier debug & readability"
// This struct will be used throughout the app for quote management and user engagement

struct ContentView: View {
    var body: some View {
        // B-001: Clean slate - app content will be built in subsequent phases
        // Empty for now, onboarding carousel (B-004) will replace this
        EmptyView()
    }
}

#Preview {
    ContentView()
}
