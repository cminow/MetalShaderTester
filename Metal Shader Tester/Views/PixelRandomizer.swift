//
//  PixelRandomizer.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 12/9/25.
//

import SwiftUI

struct PixelRandomizer: View {
    @State private var maxOffset: CGFloat = 0.0

    var body: some View {
        VStack {
            Image("roseImage")
                .visualEffect { [maxOffset] content, proxy in
                    content
                        .layerEffect(ShaderLibrary.pixelRandomizer(.float(maxOffset), .float2(proxy.size)), maxSampleOffset: .zero)
                }

            Slider(value: $maxOffset, in: 0.0...400.0) {
               Text("Shoulder Value")
            } minimumValueLabel: {
                Text("0.0")
            } maximumValueLabel: {
                Text("400.0")
            }
            .padding()
        }
    }
}

#Preview {
    PixelRandomizer()
}
