//
//  Topic.swift
//  AppleCoder
//
//  Created by ghadirianh on 26.10.24.
//
import Foundation

enum TopicTag: String, CaseIterable {
    case animation
    case effects
    case presentation
    case modal
}

struct Topic: Hashable {
    let name: String
    let githubLink: String
    let tags: [TopicTag]
}
