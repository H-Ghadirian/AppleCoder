import SwiftUI
import Combine

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedTags: [TopicTag] = []
    @State private var showTagsPopover = false

    private var topicViews: [Topic: AnyView] {
        [
            Topic(name: "Animation", githubLink: "https://github.com/your-repo/animation", tags: [.animation, .effects]): AnyView(AnimationContentView()),
            Topic(name: "Sheet", githubLink: "https://github.com/your-repo/sheet", tags: [.presentation, .modal]): AnyView(SheetContentView()),
        ]
    }

    var filteredTopics: [Topic] {
        topicViews.keys.filter { topic in
            (searchText.isEmpty || topic.name.localizedCaseInsensitiveContains(searchText)) &&
            (selectedTags.isEmpty || !selectedTags.filter(topic.tags.contains).isEmpty) // Check for intersection
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if !selectedTags.isEmpty {
                    HStack {
                        ForEach(selectedTags, id: \.self) { tag in
                            Text(tag.rawValue.capitalized)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                            
                            // Button to remove the selected tag
                            Button(action: {
                                selectedTags.removeAll { $0 == tag } // Remove the selected tag
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }

                HStack {
                    TextField("Search...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)

                    // Button to trigger the popover for tags
                    Button(action: {
                        showTagsPopover.toggle() // Toggle popover visibility
                    }) {
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.blue)
                    }
                    .padding(.leading, 5)
                    .popover(isPresented: $showTagsPopover) {
                        VStack {
                            Text("Select a Tag")
                                .font(.headline)
                                .padding()

                            ForEach(TopicTag.allCases, id: \.self) { tag in
                                Button(action: {
                                    if selectedTags.contains(tag) {
                                        selectedTags.removeAll { $0 == tag } // Deselect if already selected
                                    } else {
                                        selectedTags.append(tag) // Add to selected tags
                                    }
                                    showTagsPopover = false // Hide popover after selection
                                }) {
                                    Text(tag.rawValue.capitalized)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }

                        }
                        .padding()
                        .frame(width: 200)
                    }
                }
                .padding(.top)

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
            }
            .navigationTitle("SwiftUI Helper")
        }
    }
}

#Preview {
    ContentView()
}
