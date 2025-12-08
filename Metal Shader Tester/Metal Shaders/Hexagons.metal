//
//  Hexagons.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 11/16/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 hexagonTile(
    float2 position,
    half4 color,
    float scale
) {
    // These constants define the hexagon geometry
    float2 hexSize = float2(1.0, sqrt(3.0)/2.0);
    float2 uv = position / scale;
    
    // Convert to a hexagonal grid coordinate space
    float2 p = float2(uv.x, uv.y / hexSize.y);
    float2 a = fmod(p, 2.0);
    float2 b = fmod(p - float2(1.0, 1.0), 2.0);
    
    // Determine the cell index and center
    float2 cell = floor(p);
    if (a.x < a.y) { cell = floor(p - b); }
    
    // Calculate the distance from the center of the hexagon
    float2 center = cell + float2(0.5, 0.5);
    float d = length(p - center);
    
    // Determine the color based on the cell index
    half4 newColor;
    if (fmod(cell.x, 2.0) == 0.0) {
        newColor = half4(1.0, 0.5, 0.0, 1.0); // Orange
    } else {
        newColor = half4(0.0, 0.15, 1.0, 1.0); // Blue
    }
    
    // Create a smooth edge for the hexagon
    // You can adjust the smoothstep values for a harder or softer edge
    float edge = smoothstep(0.4, 0.41, d);
    
    return mix(newColor, color, edge);
}
