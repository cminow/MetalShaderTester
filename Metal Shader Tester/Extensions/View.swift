//
//  View.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/8/26.
//

import SwiftUI

extension View {
    func hexPixellateLayer(scale: Float = 8, hexInset: Float = 0.95, softness: Float = 4.0) -> some View {
        modifier(HexPixellateLayer(scale: scale, hexInset: hexInset, softness: softness))
    }
}

struct HexPixellateLayer: ViewModifier {
    let scale: Float
    let hexInset: Float
    let softness: Float

    func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content.layerEffect(
                ShaderLibrary.hexPixelateLayer(
                    .float2(proxy.size),
                    .float(scale),
                    .float(hexInset), // hex scale
                    .float(softness)
                ),
                maxSampleOffset: CGSize(width: Double(scale), height: Double(scale) * 1.7320508))
        }
    }
}

//==================//

extension View {
    func liteBriteLayer(dotRadius: Float = 8.0, cellFraction: Float = 1.0, softness: Float = 0.0) -> some View {
        modifier(LiteBriteDotsLayer(dotRadius: dotRadius, cellFraction: cellFraction, softness: softness))
    }
}

struct LiteBriteDotsLayer: ViewModifier {
    let dotRadius: Float
    let cellFraction: Float
    let softness: Float
    
    func body(content: Content) -> some View {
          content.visualEffect { content, proxy in
            content.layerEffect(
                ShaderLibrary.liteBriteDots(
                    .float2(proxy.size),
                    .float(dotRadius),
                    .float(cellFraction),
                    .float(softness)
                ), maxSampleOffset: .zero)
        }
    }
}
