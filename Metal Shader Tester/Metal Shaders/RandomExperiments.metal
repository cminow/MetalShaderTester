//
//  RandomExperiments.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 randomExperiment(float2 position, half4 color) {
    float value = fract(sin(dot(position, float2(12.9898, 78.233))) * 143758.5453);
    half4 newColor = half4(value, value, value, color.a);
    if (value <= 0.0025) {
        newColor = half4(1, 0, 0, 1);
    }
    return newColor;
}
