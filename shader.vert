#version 450

layout(set = 0, binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

struct Vertex {
	float vx, vy, vz;
	float cx, cy, cz;
	float tu, tv;
};
layout(set = 1, binding = 0) readonly buffer Vertices {
    Vertex vertices[];
};

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    Vertex vertex = vertices[gl_VertexIndex];
    vec3 inPosition = vec3(vertex.vx, vertex.vy, vertex.vz);
    vec3 inColor = vec3(vertex.cx, vertex.cy, vertex.cz);
    vec2 inTexCoord = vec2(vertex.tu, vertex.tv);
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
    fragColor = inColor;
    fragTexCoord = inTexCoord;
}
