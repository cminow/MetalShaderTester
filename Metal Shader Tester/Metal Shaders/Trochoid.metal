//
//  Trochoid.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/4/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 trochoid(float2 position, SwiftUI::Layer layer, float2 size, float time) {
    // Take the aspect ratio into account here:
    float2 uv = (position * 2.0 - size) / size.y;
    
    // Multiply the
    float frequency = 4.0;
    float wave1 = cos(position.x / (size.x / (frequency * 3.141592 * 2.0))) * 10 * sin(position.y / (size.y / (frequency * 3.141592 * 2.0))) * 10;
//    float wave2 = sin(position.y / (size.y / (frequency * 3.141592 * 2.0))) * 10;

    float luma = abs(1.0 / (100 * uv.y + wave1))/* + abs(1.0 / (100 * uv.x + wave2))*/;
    
    return half4(luma, luma - 0.5, 0.0, 1.0);
}
