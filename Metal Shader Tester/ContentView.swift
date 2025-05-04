//
//  ContentView.swift
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    private let thumbnailWidth: CGFloat = 50.0
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading, spacing: 4.0) {
                   
                    NavigationLink {
                        NoiseShaderView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .colorEffect(ShaderLibrary.noise())
                            Text("Black and White Noise")
                        }
                        
                    }

                    NavigationLink {
                        AddGrainShaderView()
                    } label: {
                        HStack {
                            BackgroundGradient()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.addGrain(.float(0.2)), maxSampleOffset: .zero)
                                }
                                
                            Text("Add Grain To Gradients")
                        }
                        
                    }

                    NavigationLink {
                        AddGrainToPhotoView()
                    } label: {
                        HStack {
                            Image("roseImage")
                                .resizable()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.addGrain(.float(0.75)), maxSampleOffset: .zero)
                                }
                            Text("Add Grain To Photo")
                        }
                    }
                    
                    NavigationLink {
                        RandomExperimentsView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .colorEffect(ShaderLibrary.randomExperiment())
                            Text("Experiments with Random")
                        }
                        
                    }

                    NavigationLink {
                        SimpleGradientView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .colorEffect(ShaderLibrary.simpleGradient(.float2(thumbnailWidth, thumbnailWidth)))
                            Text("Simple Gradient")
                        }
                    }

                    NavigationLink {
                        SimpleSineWaveView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.simpleSineWave(.float2(thumbnailWidth, thumbnailWidth)), maxSampleOffset: .zero)
                                }
                            Text("Simple SineWave")
                        }
                    }

                    NavigationLink {
                        TrochoidSpiralView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.trochoid(.float2(thumbnailWidth, thumbnailWidth)), maxSampleOffset: .zero)
                                }
                            Text("Trochoid Spiral")
                        }
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
