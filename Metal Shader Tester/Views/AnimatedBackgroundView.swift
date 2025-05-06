//
//  TrochoidSpiralView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/4/25.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    @State private var start: Date = Date()

    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.050)) { context in
            let time = start.distance(to: context.date)
            Rectangle()
                .visualEffect { content, proxy in
                    content
                        .layerEffect(ShaderLibrary.animated(.float2(proxy.size), .float(time)), maxSampleOffset: .zero)
                }
        }
    }
}

#Preview {
    AnimatedBackgroundView()
}
