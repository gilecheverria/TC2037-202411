/*
 * First example of using threads in C
 *
 * GIlberto Echeverria
 * 2024-05-28
 */

#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>

// Function declarations
void * thread_func(void *);

int main(int argc, char* argv[])
{
    int num_threads = 4;
    long i;

    if (argc == 2) {
        num_threads = atoi(argv[1]);
    }

    pthread_t tids[num_threads];

    for(i=0; i<num_threads; i++) {
        // pthread_create arguments:
        // - pointer to id variable
        // - pointer to thread options
        // - pointer to function
        // - pointer to funtion argument
        pthread_create(&tids[i], NULL, &thread_func, (void *)i);
        printf("Created thread %ld with id: %lu\n", i, tids[i]);
    }

    return 0;
}

void * thread_func(void * args)
{
    long id = (long) args;
    printf("This is thread %ld\n", id);
    pthread_exit(NULL);
}
