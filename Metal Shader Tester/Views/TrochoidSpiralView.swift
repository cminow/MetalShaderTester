//
//  TrochoidSpiralView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/4/25.
//

import SwiftUI

struct TrochoidSpiralView: View {
    var body: some View {
        Rectangle()
            .visualEffect { content, proxy in
                content
                    .layerEffect(ShaderLibrary.trochoid(.float2(proxy.size)), maxSampleOffset: .zero)
            }
    }
}

#Preview {
    TrochoidSpiralView()
}
