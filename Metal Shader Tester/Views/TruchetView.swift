//
//  TruchetView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 8/25/26.
//

import SwiftUI

struct TruchetView: View {
    @State private var tileSize: CGFloat = 40.0
    @State private var thickness: CGFloat = 4.0
    
    var body: some View {
        // TimelineView drives the 'time' uniform parameter for animation
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate
            
            VStack(spacing: 20) {
                // The target view that the Truchet pattern overlays onto
                ZStack {
                    LinearGradient(
                        colors: [.purple, .indigo, .black],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    Text("Truchet Mesh")
                        .font(.system(size: 36, weight: .black, design: .monospaced))
                        .foregroundColor(.white.opacity(0.3))
                }
                .frame(width: 350, height: 450)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                // Apply the metal layer effect
                .layerEffect(
                    ShaderLibrary.truchetEffect(
                        .float(tileSize),
                        .float(thickness),
                        .float(time)
                    ),
                    maxSampleOffset: .zero
                )
                
                // Controls to interactively play with the pattern properties
                VStack {
                    Text("Tile Size: \(Int(tileSize))px")
                    Slider(value: $tileSize, in: 20...100, step: 5)
                    
                    Text("Line Thickness: \(Int(thickness))px")
                    Slider(value: $thickness, in: 1...10, step: 0.5)
                }
                .font(.caption)
                .padding()
            }
        }
    }
}

#Preview {
    TruchetView()
}

