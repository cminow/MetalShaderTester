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
    float2 uv = (position / size.x) * 2.0 - 1.0;
    
    float wave = sin(position.x / 12) * 25;
    
    float luma = abs(1.0 / (100 * uv.y + wave));
    
    return half4(luma, luma - 0.5, 0.0, 1.0);
}
