//
//  Truchet.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 8/25/26.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h> // Required for SwiftUI::Layer
using namespace metal;

// Simple pseudo-random hash function based on tile coordinates
float hash(float2 p) {
    return fract(sin(dot(p, float2(127.1, 311.7))) * 43758.5453123);
}

[[ stitchable ]] half4 truchetEffect(float2 position, SwiftUI::Layer layer, float tileSize, float thickness, float time) {
    half4 origColor = layer.sample(position);
    
    float2 uv = position / tileSize;
    float2 tileId = floor(uv);
    float2 localUv = fract(uv);
    
    float h = hash(tileId); // Static random seed per tile
    if (h > 0.5) {
        localUv.x = 1.0 - localUv.x;
    }
    
    // Smoothly shift the arc radius using time to create a breathing/flowing wave effect
    float animationOffset = sin(time * 2.0 + h * 6.28) * 0.15;
    float targetRadius = 0.5 + animationOffset;
    
    float d1 = length(localUv);
    float d2 = length(localUv - float2(1.0, 1.0));
    
    float minDist = min(abs(d1 - targetRadius), abs(d2 - targetRadius));
    
    float lineThickness = thickness / tileSize;
    float patternMask = smoothstep(lineThickness, lineThickness - (1.5 / tileSize), minDist);
    
    half4 patternColor = half4(0.0, 0.7, 1.0, 1.0);
    return mix(origColor, patternColor, half(patternMask));
}

