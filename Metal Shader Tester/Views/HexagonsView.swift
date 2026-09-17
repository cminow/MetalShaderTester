//
//  HexagonsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 11/16/25.
//

import SwiftUI

struct HexagonsView: View {
    @State private var scale: Float = 12.0
    var body: some View {
        VStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.black, .gray, .yellow], startPoint: .top, endPoint: .bottom)
                )
                .hexPixellateLayer(scale: scale, hexInset: 0.95)
                .clipped()
            Slider(value: $scale, in: 4...64)
                .padding()
        }
    }
}

#Preview {
    HexagonsView()
}
