#version 330 core
out vec4 FragColor;

uniform vec3 lightColor; // Colore della luce passato dal programma principale

void main()
{
    // Il colore finale del cubo di luce � uguale al colore della luce
    FragColor = vec4(1.0);
}

