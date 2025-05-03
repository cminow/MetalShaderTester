//
//  SineExperimentsView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct RandomExperimentsView: View {
    var body: some View {
        Rectangle()
            .colorEffect(ShaderLibrary.randomExperiment())
    }
}

#Preview {
    RandomExperimentsView()
}
