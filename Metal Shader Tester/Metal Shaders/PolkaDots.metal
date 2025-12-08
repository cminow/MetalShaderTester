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

    int row = int(floor(position.y / radius));

    half4 newColor;
    float luma;
    
    if (row % 2 == 0) {
        position.x += radius / 2.0;
        float2 fraction = fract(position / radius);
        float distanceToCenter = distance(fraction, float2(0.5, 0.5));
        
        luma = 1.0 - smoothstep(0.48, 0.5, distanceToCenter);
        
        newColor = half4(luma, luma, 0.0, 1.0);
    } else {
        float2 fraction = fract(position / radius);
        float distanceToCenter = distance(fraction, float2(0.5));
        
        luma = 1.0 - smoothstep(0.48, 0.5, distanceToCenter);
        
        newColor = half4(luma, 0.0, 0.0, 1.0);
    }
    
   
    
    return newColor;
}
