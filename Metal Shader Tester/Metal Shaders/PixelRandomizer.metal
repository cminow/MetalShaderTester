//
//  PixelRandomizer.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 12/9/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 pixelRandomizer(float2 position, SwiftUI::Layer layer, float maxOffset, float2 size) {
    float value = fract(sin(dot(position, float2(12.9898, 78.233))) * 43758.5453) * maxOffset - (maxOffset * 0.5);
    
    half x = position.x + value;
    half y = position.y + value;
    
    half4 sample = layer.sample(float2(x, y));
    return sample;
}
