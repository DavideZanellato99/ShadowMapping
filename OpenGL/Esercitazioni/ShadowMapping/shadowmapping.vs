#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;

#define NR_DIRECTIONAL_LIGHTS 2

out VS_OUT {
    vec3 FragPos;
    vec3 Normal;
    vec2 TexCoords;
    vec4 FragPosLightSpace[NR_DIRECTIONAL_LIGHTS];
} vs_out;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat4 lightSpaceMatrix[NR_DIRECTIONAL_LIGHTS];

void main()
{
    vs_out.FragPos = vec3(model * vec4(aPos, 1.0));
    vs_out.Normal = transpose(inverse(mat3(model))) * aNormal;
    vs_out.TexCoords = aTexCoords;

    // Calcolo delle posizioni nello spazio luce per ogni luce direzionale
    for (int i = 0; i < NR_DIRECTIONAL_LIGHTS; i++)
    {
        vs_out.FragPosLightSpace[i] = lightSpaceMatrix[i] * vec4(vs_out.FragPos, 1.0);
    }

    gl_Position = projection * view * model * vec4(aPos, 1.0);
}