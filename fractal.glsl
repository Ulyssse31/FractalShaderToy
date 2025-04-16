void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 p = (2.0*fragCoord - iResolution.xy)/iResolution.y;
    float tz = 0.5 - 0.5 * cos(0.225 * iTime);
    float zoo = pow(0.5, 20.0 * tz);
    vec2 c = vec2(-0.05, .6805) + p * zoo;
    vec2 z = vec2(0.0);

    int maxIter = 1000;
    int i;
    for (i = 0; i < maxIter; i++) {
        float x = (z.x * z.x - z.y * z.y) + c.x;
        float y = (2.0 * z.x * z.y) + c.y;
        z = vec2(x, y);
        if (dot(z, z) > 4.0) break;
    }
    float t = float(i) / float(maxIter);
    fragColor = vec4(t,t,t, 1.0);
}