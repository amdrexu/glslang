#version 450 core

#extension GL_AMD_shader_extensions:enable

[[spirv_extinst("AMD_shader_trinary_minmax", 1)]]
float min3(float, float, float);

[[spirv_extinst("AMD_shader_trinary_minmax", 1)]]
vec3 min3(vec3, vec3, vec3);

[[spirv_extinst("AMD_shader_trinary_minmax", 3)]]
int min3(int, int, int);

[[spirv_extinst("AMD_shader_ballot", 4)]]
int mbcntAMD(int);

layout(location = 0) in vec4 fIn;

void main()
{
    float data = min3(fIn.x, fIn.y, fIn.z);
    data += min3(fIn.xyw, vec3(0.0), vec3(2.0)).y;
    data += min3(int(fIn.x), 0, 1);
    data += mbcntAMD(0xFF00FF);

    gl_Position = vec4(data);
}
