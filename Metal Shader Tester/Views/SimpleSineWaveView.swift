//
//  SimpleSineWaveView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/3/25.
//

import SwiftUI

struct SimpleSineWaveView: View {
    var body: some View {
        Rectangle()
            .visualEffect { content, proxy in
                content
                    .layerEffect(ShaderLibrary.simpleSineWave(.float2(proxy.size)), maxSampleOffset: .zero)
            }
    }
}

#Preview {
    SimpleSineWaveView()
}
