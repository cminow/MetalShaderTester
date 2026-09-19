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
                        Voronoi()
                    } label: {
                        HStack {
                            Color.blue
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content.colorEffect(ShaderLibrary.voronoiOrganic(
                                        .float2(proxy.size),
                                        .float(1.0)
                                    ))
                                }
                            
                            Text("Voronoi")
                        }
                    }
                    NavigationLink {
                        TruchetView()
                    } label: {
                        HStack {
                            Color.black
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content.layerEffect(ShaderLibrary.truchetEffect(
                                        .float(20),
                                        .float(4),
                                        .float(1)
                                    ), maxSampleOffset: .zero)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                            Text("Truchet")
                        }
                    }

                    NavigationLink {
                        PixelRandomizer()
                    } label: {
                        HStack {
                            Image("roseImage")
                                .resizable()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.pixelRandomizer(.float(10.0), .float2(proxy.size)), maxSampleOffset: .zero)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text("Pixel Randomizer")
                        }
                        
                    }
                    NavigationLink {
                        HexagonsView()
                    } label: {
                        HStack {
                            Rectangle()
                                .fill(.green)
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .hexPixellateLayer(scale: 8)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text("Hexagons")
                        }
                        
                    }
                    
                    NavigationLink {
                        NoiseShaderView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .colorEffect(ShaderLibrary.noise())
                                .clipShape(RoundedRectangle(cornerRadius: 8))
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
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
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
                                .clipShape(RoundedRectangle(cornerRadius: 8))
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
                                .clipShape(RoundedRectangle(cornerRadius: 8))
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
                                .clipShape(RoundedRectangle(cornerRadius: 8))
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
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text("Simple SineWave")
                        }
                    }

                    NavigationLink {
                        AnimatedBackgroundView()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .visualEffect { content, proxy in
                                    content
                                        .layerEffect(ShaderLibrary.animated(.float2(thumbnailWidth, thumbnailWidth), .float(1.0)), maxSampleOffset: .zero)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text("Animated")
                        }
                    }

                    NavigationLink {
                        PolkaDots()
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: thumbnailWidth, height: thumbnailWidth)
                                .colorEffect(ShaderLibrary.polkaDots(.float2(thumbnailWidth, thumbnailWidth), .float(4.0)))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            Text("Polka Dots")
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
