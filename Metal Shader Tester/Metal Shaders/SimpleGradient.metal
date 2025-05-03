//
//  SimpleGradient.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/3/25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 simpleGradient(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
    float red = 1.0 - (1.0 * uv.y);
    half4 newColor = half4(red, 0.0, 0.0, 1.0);
    return newColor;
}
