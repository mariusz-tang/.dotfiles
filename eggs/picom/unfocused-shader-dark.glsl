#version 330
in vec2 texcoord;

uniform sampler2D tex;

const float a = 0.5;
const vec3 dim_color = vec3(40, 40, 40) / 255;

vec4 default_post_processing(vec4 c);

// Apply the default shader and then mix with dim_color.
vec4 window_shader() {
   vec2 texsize = textureSize(tex, 0);
   vec4 c = texture2D(tex, texcoord / texsize, 0);
   c = default_post_processing(c);
   if (c.a >= 0.9)
       c.rgb = (1 - a) * c.rgb + a * dim_color.rgb;
   return c;
}
