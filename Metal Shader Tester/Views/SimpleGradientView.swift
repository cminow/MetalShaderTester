//
//  SimpleGradientView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/3/25.
//

import SwiftUI

struct SimpleGradientView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .colorEffect(ShaderLibrary.simpleGradient(.float2(proxy.size)))
        }
        
    }
}

#Preview {
    SimpleGradientView()
}
