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
            BackgroundGradient()
            ZStack {
                BackgroundGradient()
                    .visualEffect { content, proxy in
                        content
                            .layerEffect(ShaderLibrary.addGrain(.float(0.2)), maxSampleOffset: .zero)
                    }
            }
        }
        
    }
}

#Preview {
    AddGrainShaderView()
}
