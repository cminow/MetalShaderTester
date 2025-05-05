//
//  PolkaDots.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/5/25.
//

import SwiftUI

struct PolkaDots: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Rectangle()
                    .colorEffect(ShaderLibrary.polkaDots(.float2(proxy.size), .float(20.0)))
                Text("20 columns")
                Rectangle()
                    .colorEffect(ShaderLibrary.polkaDots(.float2(proxy.size), .float(10.0)))
                Text("10 columns")
            }
        }
    }
}

#Preview {
    PolkaDots()
}
