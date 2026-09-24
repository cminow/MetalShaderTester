//
//  OpArt.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/24/26.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 opArt(float2 position, half4 color, float2 layerSize, float gridCount) {
    float gridSize = gridCount;
    float cellSize = min(layerSize.x, layerSize.y) / gridSize;
    
    float2 scaledUV = position / cellSize;

    float2 localPosition = fract(scaledUV);
    float2 center = localPosition - 0.5;
    float distanceFromCenter = length(center);
    float radius = 0.5;
    
    float2 cellID = floor(scaledUV);
    float checker = fmod(cellID.x + cellID.y, 2.0);
    
    float brightness;
    
    if (checker < 0.5) {
        brightness = 1.0;
        brightness = smoothstep(radius - 0.05, radius, length(center));
    } else {
        brightness = 0.0;
        brightness = 1.0 - smoothstep(radius - 0.05, radius, distanceFromCenter);
    }
    
    return half4(brightness, brightness, brightness, 1.0);
}
