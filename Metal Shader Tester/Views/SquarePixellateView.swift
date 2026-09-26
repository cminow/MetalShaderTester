//
//  SquarePixellateView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/26/26.
//

import SwiftUI

struct SquarePixellateView: View {
    @State private var columnCount: Float = 40.0

    var body: some View {
        let columnCount = columnCount //  This gets rid of a main-actor warning where I pass it to the shader.

        VStack {
            Image("roseImage")
                .visualEffect { content, proxy in
                    content
                        .layerEffect(
                            ShaderLibrary.pixellateSquares(
                                .float2(proxy.size),
                                .float(columnCount) // <- Swift 6 main actor warning here
                            ), maxSampleOffset: .zero)
                }

            VStack(alignment: .leading) {
                Text("Column Count: \(columnCount.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $columnCount, in: 2...128)
            }
            .padding()
        }
    }
}

#Preview {
    SquarePixellateView()
}
