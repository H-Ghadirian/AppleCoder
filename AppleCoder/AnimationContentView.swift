//
//  AnimationContentView.swift
//  AppleCoder
//
//  Created by ghadirianh on 26.10.24.
//
import SwiftUI

struct AnimationContentView: View {
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Circle()
                .fill(isAnimating ? Color.red : Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .animation(.easeInOut(duration: 1.0), value: isAnimating)
                .onAppear {
                    isAnimating.toggle()
                }
            Text("Animation Example")
                .font(.headline)
                .padding(.top)
        }
    }
}
#Preview { AnimationContentView() }
