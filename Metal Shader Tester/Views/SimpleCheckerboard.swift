//
//  SimpleCheckerboard.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/24/26.
//

import SwiftUI

struct SimpleCheckerboard: View {
    var body: some View {
        Color.red
            .visualEffect { content, proxy in
                content.colorEffect(ShaderLibrary.simpleCheckerboard(.float2(proxy.size)))
            }
    }
}

#Preview {
    SimpleCheckerboard()
}
