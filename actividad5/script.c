#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <stdio.h>

void *thread_function(void *arg) {
    printf("Hilo creado\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread;

    pid = fork(); // (1)
    if (pid == 0) {
        // Proceso hijo
        fork(); // (2)
        pthread_create(&thread, NULL, thread_function, NULL); // (3)
        pthread_join(thread, NULL);
    }
    fork(); // (4)

    return 0;
}