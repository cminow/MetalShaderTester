//
//  PolkaDots.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 5/5/25.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 polkaDots(float2 position, half4 color, float2 canvasSize, float columns) {

    float radius = canvasSize.x / columns;

    float row = position.y / radius;
    float rowOffset = floor(row);

    float yCenter = position.y;
    
    float2 fraction = fract(float2(position.x - (rowOffset * radius / 2.0), yCenter) / radius);
    float distanceToCenter = distance(fraction, float2(0.5));
    
    float luma = 1.0 - smoothstep(0.48, 0.49, distanceToCenter);
    
    half4 newColor = half4(luma, luma, 0.0, 1.0);
    
    return newColor;
}
