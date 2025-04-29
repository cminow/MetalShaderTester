//
//  NoiseShader.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 noise(float2 position, half4 color) {
    float value = fract(sin(dot(position, float2(12.9898, 78.233))) * 43758.5453);
    half4 noise_grain = half4(value, value, value, color.a);
    return noise_grain;
}
