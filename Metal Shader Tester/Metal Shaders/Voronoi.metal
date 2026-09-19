//
//  Voronoi.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/19/26.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 voronoiOrganic(float2 position, half4 color, float2 size, float time) {
    float2 uv = position / size;
    // Correct for aspect ratio:
    float aspect = size.x / size.y;
    uv.x *= aspect;
    float2 scaledUV = uv * 15.0;



    float2 gridID = floor(scaledUV);
    float2 gridUV = fract(scaledUV);

    float minDist1 = 10.0;  // Closest
    float minDist2 = 10.0;  // Second closest
    float2 closestID;

    // Check 3x3 grid of neighbors
    for (int y = -1; y <= 1; y++) {
      for (int x = -1; x <= 1; x++) {
          float2 neighbor = float2(x, y);
          float2 cellID = gridID + neighbor;

          // Animated random point in each cell
          float2 pointOffset = float2(
              fract(sin(dot(cellID, float2(12.9898, 78.233))) * 43758.5453),
              fract(sin(dot(cellID, float2(78.233, 12.9898))) * 43758.5453)
          );

          // Add subtle animation
          pointOffset += sin(time * 2.0 + pointOffset * 6.28) * 0.1;

          float2 point = neighbor + pointOffset;
          float dist = length(point - gridUV);

          if (dist < minDist1) {
              minDist2 = minDist1;
              minDist1 = dist;
              closestID = cellID;
          } else if (dist < minDist2) {
              minDist2 = dist;
          }
      }
    }

    // Color based on cell
    half3 cellColor = half3(
      fract(sin(closestID.x * 12.9898) * 43758.5453),
      fract(sin(closestID.y * 78.233) * 43758.5453),
      fract(sin(dot(closestID, float2(45.678, 98.765))) * 43758.5453)
    );

    return half4(cellColor, 1.0);
}
