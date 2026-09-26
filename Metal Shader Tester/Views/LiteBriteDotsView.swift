//
//  LiteBriteDotsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/26/26.
//

import SwiftUI

struct LiteBriteDotsView: View {
    @State private var dotRadius: Float = 8.0
    @State private var cellFraction: Float = 1.0
    @State private var softness: Float = 0.0

    var body: some View {
        VStack {
            Image("roseImage")
                .liteBriteLayer(dotRadius: dotRadius, cellFraction: cellFraction, softness: softness)

            VStack(alignment: .leading) {
                Text("Dot Radius: \(dotRadius.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $dotRadius, in: 2...100)
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Cell Fraction: \(cellFraction.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $cellFraction, in: 0.0...1.0)
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Softness: \(softness.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $softness, in: 0.0...20.0)
            }
            .padding()
        }
    }
}

#Preview {
    LiteBriteDotsView()
}
