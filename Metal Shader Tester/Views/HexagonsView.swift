//
//  HexagonsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 11/16/25.
//

import SwiftUI

struct HexagonsView: View {
    @State private var scale: Float = 12.0
    @State private var hexInset: Float = 0.95
    @State private var softness: Float = 2.0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.black, .gray, .yellow], startPoint: .top, endPoint: .bottom)
                )
                .hexPixellateLayer(scale: scale, hexInset: hexInset, softness: softness)
                .clipped()
            Slider(value: $scale, in: 4...64)
                .padding()
            
            Slider(value: $hexInset, in: 0.0...1.0)
                .padding()
            
            Slider(value: $softness, in: 0.0...24.0)
                .padding()
        }
    }
}

#Preview {
    HexagonsView()
}
