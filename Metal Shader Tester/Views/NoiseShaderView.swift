//
//  NoiseShaderView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct NoiseShaderView: View {
    var body: some View {
        Rectangle()
            .colorEffect(ShaderLibrary.noise())
    }
}

#Preview {
    NoiseShaderView()
}
