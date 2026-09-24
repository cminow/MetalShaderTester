//
//  Voronoi.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/19/26.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h> // Required for SwiftUI::Layer
using namespace metal;

[[stitchable]] half4 voronoiOrganic(
                      float2 position,
                      SwiftUI::Layer layer,
                      float2 size,
                      float time) {
    float2 uv = position / size;
    float aspect = size.x / size.y;
    uv.x *= aspect;
    float2 scaledUV = uv * 15.0;

    float2 gridID = floor(scaledUV);
    float2 gridUV = fract(scaledUV);

    float minDist1 = 10.0;
    float minDist2 = 10.0;
    float2 closestID = gridID;
    float2 closestPointAbs = gridID; // NEW: absolute position of the winning feature point, in scaledUV space

    for (int y = -1; y <= 1; y++) {
      for (int x = -1; x <= 1; x++) {
          float2 neighbor = float2(x, y);
          float2 cellID = gridID + neighbor;

          float2 pointOffset = float2(
              fract(sin(dot(cellID, float2(12.9898, 78.233))) * 43758.5453),
              fract(sin(dot(cellID, float2(78.233, 12.9898))) * 43758.5453)
          );
          pointOffset += sin(time * 2.0 + pointOffset * 6.28) * 0.1;

          float2 point = neighbor + pointOffset; // relative to current cell's gridUV
          float dist = length(point - gridUV);

          if (dist < minDist1) {
              minDist2 = minDist1;
              minDist1 = dist;
              closestID = cellID;
              closestPointAbs = cellID + pointOffset; // NEW: point's true position in scaledUV space
          } else if (dist < minDist2) {
              minDist2 = dist;
          }
      }
    }

    // Convert the feature point back out of scaledUV space into pixel space
    float2 sampleUV = closestPointAbs / 15.0;
    sampleUV.x /= aspect;              // undo the aspect correction you applied going in
    float2 samplePos = sampleUV * size;
    samplePos = clamp(samplePos, float2(0.5), size - float2(0.5)); // stay inside the layer bounds

    half4 cellColor = layer.sample(samplePos);

    return cellColor;
}
