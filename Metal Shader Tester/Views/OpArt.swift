//
//  OpArt.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/24/26.
//

import SwiftUI

struct OpArt: View {
    let startDate: Date = Date()

    var body: some View {
        TimelineView(.animation) { context in
            let elapsed = context.date.timeIntervalSince(startDate)

            Color.red
                .visualEffect { content, proxy in
                    content.colorEffect(
                        ShaderLibrary.opArt(
                            .float2(proxy.size),
                            .float(16.0),
                            .float(elapsed)
                        )
                    )
                }
        }
        
    }
}

#Preview {
    OpArt()
}
