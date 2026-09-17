//
//  View.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/8/26.
//

import SwiftUI

extension View {
    func hexPixellateLayer(scale: Float = 8, hexInset: Float = 0.95) -> some View {
        modifier(HexPixellateLayer(scale: scale, hexInset: hexInset))
    }
}

struct HexPixellateLayer: ViewModifier {
    let scale: Float
    let hexInset: Float

    func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content.layerEffect(
                ShaderLibrary.hexPixelateLayer(
                    .float2(proxy.size),
                    .float(scale),
                    .float(hexInset) // hex scale
                ),
                maxSampleOffset: CGSize(width: Double(scale), height: Double(scale) * 1.7320508))
        }
    }
}

