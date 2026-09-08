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
            .fill(.blue)
            .hexPixellateLayer(scale: 16)
            
    }
}

#Preview {
    HexagonsView()
}
