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
    float value1 = fract(sin(dot(position, float2(12.9898, 78.233))) * 43758.5453) * maxOffset - (maxOffset * 0.5);
    float value2 = fract(sin(dot(position, float2(12.9898, 79.233))) * 23758.5453) * maxOffset - (maxOffset * 0.5);
    
    float x = position.x + value1;
    float y = position.y + value2;

    if (x < 0.0) {
        x = 2.0;
    }
    
    if (x > size[0]) {
        x = size[0] - 2.0;
    }

    if (y < 0.0) {
        y = 2.0;
    }
    
    if (y > size[1]) {
        y = size[1] - 2.0;
    }
    
    half4 sample = layer.sample(float2(x, y));
    return sample;
}
