//
//  TrochoidSpiralView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/4/25.
//

import SwiftUI

struct TrochoidSpiralView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.1)) { context in
//            let _ = print(Date.now.timeIntervalSinceReferenceDate)
            Rectangle()
                .visualEffect { content, proxy in
                    content
                        .layerEffect(ShaderLibrary.trochoid(.float2(proxy.size), .float(Date.now.timeIntervalSinceReferenceDate)), maxSampleOffset: .zero)
                }
        }
    }
}

#Preview {
    TrochoidSpiralView()
}
