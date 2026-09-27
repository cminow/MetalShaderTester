//
//  LiteBriteDots.metal
//  Metal Shader Tester
//
//  Created by Charlie Minow on 9/26/26.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]]
half4 liteBriteDots(float2 position, SwiftUI::Layer layer, float2 layerSize, float scale, float dotSize, float softness, half4 bgColor) {
    
    float2 r = float2(1.0, 1.7320508) * scale;
    float2 h = r * 0.5;

    float2 a = floor((position - h) / r) * r + h;
    float2 b = floor(position / r) * r;

    float2 distA = position - (a + h);
    float2 distB = position - (b + h);
    float2 center = dot(distA, distA) < dot(distB, distB) ? (a + h) : (b + h);
    
    float inradius = scale * 0.5 * saturate(dotSize);
    
    float feather = max(softness, 0.0) * 0.5 + 0.5;
    float d = length(position - center);
    float coverage = 1.0 - smoothstep(inradius - feather, inradius + feather, d);
    
    float2 clampedCenter = clamp(center, float2(0.5), layerSize - float2(0.5));
    float2 clampedPosition = clamp(position, float2(0.5), layerSize - float2(0.5));

    half4 sampledColor = layer.sample(clampedCenter);       // color for the dot
    half4 originalAtPixel = layer.sample(clampedPosition);  // true backdrop at this pixel

    // Composite bgColor OVER the original content (both premultiplied)
    half4 background = bgColor + originalAtPixel * (1.0h - bgColor.a);

    half4 dotColor = half4(sampledColor.rgb, 1.0h);
    
    return mix(background, dotColor, half(coverage));
}
