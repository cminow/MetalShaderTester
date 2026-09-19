//
//  Voronoi.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/19/26.
//

import SwiftUI

struct Voronoi: View {
    let startDate: Date = Date()
    
    var body: some View {
        TimelineView(.animation) { context in
            let elapsed = context.date.timeIntervalSince(startDate)
            Rectangle()
                .visualEffect { content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.voronoiOrganic(
                                .float2(proxy.size),
                                .float(elapsed)
                            )
                        )
                }
        }
    }
}

#Preview {
    Voronoi()
}
