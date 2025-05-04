//
//  SimpleSineWave.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/3/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 simpleSineWave(float2 position, SwiftUI::Layer layer, float2 size) {
    // Take the aspect ratio into account here:
    float2 uv = (position * 2.0 - size) / size.y;
    
    // Multiply the
    float frequency = 3.0;
    float wave = sin(position.x / (size.x / (frequency * 3.141592 * 2.0))) * 10;
    
    float luma = abs(1.0 / (100 * uv.y + wave));
    
    return half4(luma, luma - 0.5, 0.0, 1.0);
}
