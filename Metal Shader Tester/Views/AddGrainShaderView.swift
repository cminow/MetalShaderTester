//
//  AddGrainShaderView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct AddGrainShaderView: View {
    var body: some View {
        VStack {
            backgroundGradient
            ZStack {
                backgroundGradient
                    .visualEffect { content, proxy in
                        content
                            .layerEffect(ShaderLibrary.addGrain(.float(0.2)), maxSampleOffset: .zero)
                    }
            }
        }
        
    }

    private var backgroundGradient: MeshGradient {
        MeshGradient(width: 3, height: 3, points: [
            [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
            [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
            [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
        ], colors: [
            Color(.systemRed), Color(.systemTeal), Color(.systemOrange),
            Color(.systemCyan), Color(.systemMint), Color(.systemIndigo),
            Color(.systemIndigo), Color(.systemYellow), Color(.systemRed)
        ])
    }
}

#Preview {
    AddGrainShaderView()
}
