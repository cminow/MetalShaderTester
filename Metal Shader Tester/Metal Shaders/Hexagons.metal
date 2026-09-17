#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

// From Apple's documentation: https://developer.apple.com/library/archive/samplecode/MetalShaderShowcase/Listings/MetalShaderShowcase_AAPLWoodShader_metal.html
// Generate a random float in the range [0.0f, 1.0f] using x, y, and z (based on the xor128 algorithm)
float newRand(int x, int y, int z) {
    int seed = x + y * 57 + z * 241;
    seed = (seed << 13) ^ seed;
    return (( 1.0 - ( (seed * (seed * seed * 15731 + 789221) + 1376312589) & 2147483647) / 1073741824.0f) + 1.0f) / 2.0f;
}

// Signed-ish distance from the centre of a pointy-top hexagon.
// Returns the distance measured against the hexagon's three edge normals,
// so a value of `inradius` lands exactly on an edge.
float hexDistance(float2 p) {
    float2 q = abs(p);
    return max(q.x, dot(q, float2(0.5, 0.8660254)));
}

[[ stitchable ]] half4 hexPixelateLayer(
    float2 position,
    SwiftUI::Layer layer,
    float2 size,    // 💡 Pass the view boundaries
    float scale,
    float hexSize   // 💡 0...1 — fraction of the cell the hexagon fills
) {
    float2 r = float2(1.0, 1.7320508) * scale;
    float2 h = r * 0.5;

    float2 a = floor((position - h) / r) * r + h;
    float2 b = floor(position / r) * r;

    float2 distA = position - (a + h);
    float2 distB = position - (b + h);
    float2 center = dot(distA, distA) < dot(distB, distB) ? (a + h) : (b + h);

    // How far inside the cell we are, compared with how far the hexagon reaches.
    // The inradius of a cell is scale * 0.5; hexSize shrinks it towards the centre.
    float inradius = scale * 0.5 * saturate(hexSize);

    if (hexDistance(position - center) > inradius) {
        // Outside the hexagon: hand back the original pixel untouched.
        return layer.sample(position);
    }

    // Clamp the center coordinates inside the view bounds.
    // Subtracting a tiny fraction (0.5) ensures it never samples exactly on the boundary pixel.
    float2 clampedCenter = clamp(center, float2(0.5), size - float2(0.5));

    half4 sampledColor = layer.sample(clampedCenter);

    float randomValue = newRand(int(clampedCenter.x), int(clampedCenter.y), 5) * 0.5;

    sampledColor.r += randomValue;
    sampledColor.g += randomValue;
    sampledColor.b += randomValue;

    return sampledColor;
}
