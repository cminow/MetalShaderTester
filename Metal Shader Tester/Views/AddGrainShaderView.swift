//
//  AddGrainShaderView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct AddGrainShaderView: View {
    var body: some View {
        ZStack {
            backgroundGradient
                .visualEffect { content, proxy in
                    content
                        .layerEffect(ShaderLibrary.addGrain(), maxSampleOffset: .zero)
                }
        }
    }

    private var backgroundGradient: MeshGradient {
        MeshGradient(width: 3, height: 3, points: [
            [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
            [0.0, 0.55], [0.5, 0.5], [1.0, 0.85],
            [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
        ], colors: [
            Color(.systemRed).opacity(0.5), Color(.systemTeal).opacity(0.20), Color(.systemOrange).opacity(0.25),
            Color(.systemCyan), Color(.systemMint), Color(.systemIndigo),
            Color(.systemIndigo), Color(.systemYellow), Color(.systemRed)
        ])
    }
}

#Preview {
    AddGrainShaderView()
}
