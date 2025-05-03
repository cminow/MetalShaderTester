//
//  AddGrain.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 addGrain(float2 position, SwiftUI::Layer layer, float grain_amount) {
    half4 sample = layer.sample(position);
    half originalAlpha = sample.a;
    float value = fract(sin(dot(position, float2(12.9898, 78.233))) * 43758.5453) - 0.5;
    sample -= value * grain_amount;
    sample.a = originalAlpha;
    return sample;
}
