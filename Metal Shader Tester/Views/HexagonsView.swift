//
//  HexagonsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 11/16/25.
//

import SwiftUI

struct HexagonsView: View {
    var body: some View {
        Rectangle()
            .colorEffect(ShaderLibrary.hexagonTile(.float(100.0)))
    }
}

#Preview {
    HexagonsView()
}
