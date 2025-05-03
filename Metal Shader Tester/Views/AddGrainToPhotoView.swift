//
//  AddGrainToPhotoView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct AddGrainToPhotoView: View {
    var body: some View {
        VStack {
            Image("roseImage")
            ZStack {
                Image("roseImage")
                    .visualEffect { content, proxy in
                        content
                            .layerEffect(ShaderLibrary.addGrain(.float(0.75)), maxSampleOffset: .zero)
                    }
            }
        }
    }
}

#Preview {
    AddGrainToPhotoView()
}
