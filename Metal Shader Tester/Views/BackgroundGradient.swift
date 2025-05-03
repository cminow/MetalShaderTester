//
//  BackgroundGradient.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/3/25.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
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
    BackgroundGradient()
}
