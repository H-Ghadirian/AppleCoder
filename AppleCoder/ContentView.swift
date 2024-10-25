//
//  ContentView.swift
//  AppleCoder
//
//  Created by ghadirianh on 25.10.24.
//

import SwiftUI

struct ContentView: View {
    private var topicViews: [Topic: AnyView] {
        [
            Topic(name: "Animation", githubLink: "https://github.com/your-repo/animation"): AnyView(AnimationContentView()),
            Topic(name: "Sheet", githubLink: "https://github.com/your-repo/sheet"): AnyView(SheetContentView()),
            // Add more mappings here
        ]
    }

    // State for search
    @State private var searchText = ""

    var filteredTopics: [Topic] {
        topicViews.keys.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List(filteredTopics, id: \.name) { topic in
                NavigationLink(destination: {
                    if let contentView = topicViews[topic] {
                        DetailView(topic: topic, content: contentView)
                    } else {
                        Text("Content not available")
                    }
                }) {
                    Text(topic.name)
                        .padding(.vertical, 5)
                }
            }
            .listStyle(.plain)
            .navigationTitle("SwiftUI Helper")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

#Preview {
    ContentView()
}
