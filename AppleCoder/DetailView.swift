//
//  DetailView.swift
//  AppleCoder
//
//  Created by ghadirianh on 26.10.24.
//
import SwiftUI

struct DetailView: View {
    let topic: Topic
    let content: AnyView

    var body: some View {
        VStack {
            content

            // GitHub Link Button
            Link("View Code on GitHub", destination: URL(string: topic.githubLink)!)
                .font(.headline)
                .padding()
                .foregroundColor(.blue)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    DetailView(topic: .init(name: "SwiftUI", githubLink: "https://github.com/ghadirianh/AppleCoder/blob/master/SwiftUI/ContentView.swift", tags: []), content: AnyView(Text("Hello, World!")))
}
