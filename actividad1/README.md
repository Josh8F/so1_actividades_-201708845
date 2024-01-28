
# Resumen sobre Sistemas Operativos y Kernels

## Nombre: Joshua Franco
## ID: 201708845

### Tipos de Kernel y sus diferencias
- **Kernel Monolítico**: Gestiona todas las funciones del sistema operativo en un solo bloque de código. Alto rendimiento pero menos modular.
- **Kernel Microkernel**: Maneja funciones esenciales del sistema operativo. Mayor modularidad y flexibilidad pero puede impactar el rendimiento.
- **Kernel Híbrido**: Combina características de kernels monolítico y microkernel. Equilibrio entre eficiencia, rendimiento y modularidad.
- **Kernel Exokernel**: Asigna recursos del hardware a programas, ofreciendo un rendimiento excepcional pero con alta complejidad.

### User Mode vs Kernel Mode
- **Modo de Usuario (User Mode)**: Ambiente restringido para aplicaciones. Protección contra interferencias con el sistema operativo.
- **Modo Kernel (Kernel Mode)**: Acceso completo al hardware, gestiona recursos y maneja interrupciones. Vital para el funcionamiento del sistema operativo.

### Interrupciones vs Trampas
- **Traps (Trampas)**: Eventos sincrónicos generados por software, usualmente relacionados con errores o solicitudes de servicio.
- **Interrupts (Interrupciones)**: Eventos asincrónicos, pueden ser generados por hardware o software, respondiendo a necesidades inmediatas del sistema.
