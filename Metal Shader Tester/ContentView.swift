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
                    NavigationLink("Black and White Noise") {
                        NoiseShaderView()
                    }
                    NavigationLink("Add Grain To Gradients") {
                        AddGrainShaderView()
                    }
                    NavigationLink("Add Grain To Photo") {
                        AddGrainToPhotoView()
                    }
                    
                    NavigationLink("Experiments with Random") {
                        RandomExperimentsView()
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
