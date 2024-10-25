//
//  SheetContentView.swift
//  AppleCoder
//
//  Created by ghadirianh on 26.10.24.
//

import SwiftUI

struct SheetContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            VStack {
                Text("This is a sheet!")
                    .font(.title)
                    .padding()
                Button("Dismiss") {
                    showingSheet.toggle()
                }
            }
            .padding()
        }
    }
}
#Preview { SheetContentView() }
