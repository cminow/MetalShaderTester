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
        VStack {
            TimelineView(.animation) { context in
                let elapsed = context.date.timeIntervalSince(startDate)
                LinearGradient(colors: [.red, .green, .blue], startPoint: .top, endPoint: .bottom)
                    .visualEffect { content, proxy in
                        content
                            .layerEffect(
                                ShaderLibrary.voronoiOrganic(
                                    .float2(proxy.size),
                                    .float(elapsed),
                                    .float(10.0)
                                ), maxSampleOffset: CGSize(width: proxy.size.width / 15 * 2.5, height: proxy.size.height / 15 * 2.5))
                    }
                    .clipped()
                Image("roseImage")
                    .visualEffect { content, proxy in
                        content
                            .layerEffect(
                                ShaderLibrary.voronoiOrganic(
                                    .float2(proxy.size),
                                    .float(elapsed),
                                    .float(40)
                                ), maxSampleOffset: CGSize(width: proxy.size.width / 15 * 2.5, height: proxy.size.height / 15 * 2.5))
                    }
                    .clipped()
            }
        }
        
    }
}

#Preview {
    Voronoi()
}
