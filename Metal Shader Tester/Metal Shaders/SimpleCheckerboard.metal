//
//  SimpleCheckerboard.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/24/26.
//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 simpleCheckerboard(float2 position, half4 color, float2 layerSize, float gridCount) {
    float gridSize = gridCount;
    float cellSize = min(layerSize.x, layerSize.y) / gridSize;
    
    float2 scaledUV = position / cellSize;

    float2 cellID = floor(scaledUV);
    float checker = fmod(cellID.x + cellID.y, 2.0);
    
    float brightness = (checker < 0.5) ? 1.0 : 0.0;
    
    return half4(brightness, brightness, brightness, 1.0);
}
