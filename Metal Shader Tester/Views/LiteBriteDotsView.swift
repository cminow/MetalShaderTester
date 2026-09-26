//
//  LiteBriteDotsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/26/26.
//

import SwiftUI

struct LiteBriteDotsView: View {
    var body: some View {
        VStack {
            Image("roseImage")
                .visualEffect { content, proxy in
                    content.layerEffect(ShaderLibrary.liteBriteDots(
                        .float2(proxy.size),
                        .float(8.0), // dot radius
                        .float(0.90), // fraction of the cell they fill
                        .float(0.0) // softness
                    ), maxSampleOffset: .zero)
                }
        }
    }
}

#Preview {
    LiteBriteDotsView()
}
