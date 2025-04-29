//
//  ContentView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading, spacing: 4.0) {
                    NavigationLink("Noise Shader View") {
                        NoiseShaderView()
                    }
                    NavigationLink("Add Grain Shader View") {
                        AddGrainShaderView()
                    }
                }
                .padding()
                Spacer()
            }
            Spacer()
        }
        .navigationTitle("Bob's yer uncle.")
    }
}

#Preview {
    ContentView()
}
