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
    @State private var layerSource = "Gradient"
    let layerSources = ["Gradient", "Image"]
    
    var body: some View {
        VStack {
            if layerSource == "Gradient" {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.black, .gray, .yellow], startPoint: .top, endPoint: .bottom)
                    )
                    .hexPixellateLayer(scale: scale, hexInset: hexInset, softness: softness)
                    .clipped()
            } else {
                Image("roseImage")
                    .hexPixellateLayer(scale: scale, hexInset: hexInset, softness: softness)
                    .clipped()
            }
            

            Picker("Layer Source", selection: $layerSource) {
                ForEach(layerSources, id: \.self) { layerSource in
                    Text(layerSource).tag(layerSource)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            VStack(alignment: .leading) {
                Text("Scale: \(scale.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $scale, in: 4...128)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Gutter: \(hexInset.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $hexInset, in: 0.0...1.0)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Edge Softness: \(softness.formatted(.number.precision(.fractionLength(2))))")
                Slider(value: $softness, in: 0.0...24.0)
            }
            .padding()
            
        }
    }
}

#Preview {
    HexagonsView()
}
