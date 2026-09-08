//
//  NoiseShader.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 4/29/25.
//

#include <metal_stdlib>
using namespace metal;


// From Apple's documentation: https://developer.apple.com/library/archive/samplecode/MetalShaderShowcase/Listings/MetalShaderShowcase_AAPLWoodShader_metal.html
// Generate a random float in the range [0.0f, 1.0f] using x, y, and z (based on the xor128 algorithm)
float rand(int x, int y, int z) {
    int seed = x + y * 57 + z * 241;
    seed = (seed<< 13) ^ seed;
    return (( 1.0 - ( (seed * (seed * seed * 15731 + 789221) + 1376312589) & 2147483647) / 1073741824.0f) + 1.0f) / 2.0f;
}

[[stitchable]] half4 noise(float2 position, half4 color) {
    float value = fract(sin(dot(position, float2(12.9898, 78.233))) * 43758.5453);
//    float value = rand(position.x, position.y, position.x + position.y);
    half4 noise_grain = half4(value, value, value, color.a);
    return noise_grain;
}
