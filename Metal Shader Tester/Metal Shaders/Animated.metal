//
//  Trochoid.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/4/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 animated(float2 position, SwiftUI::Layer layer, float2 size, float time) {
    // Take the aspect ratio into account here:
    float2 uv = (position * 2.0 - size) / size.y;

    float frequency = 8.0;
    float wave = cos((position.x + (time * 0.0)) / (size.x / (frequency * 3.141592 * 2.0))) * 10 * sin(position.y / (size.y / (frequency * 3.141592 * 2.0))) * sin(time) * 10.0;

    float luma = abs(10.0 / (100 * uv.y + wave));
    
    return half4(luma, luma - 0.5, 0.0, 1.0);
}
