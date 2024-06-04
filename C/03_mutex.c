/*
 * Adding into a single variable from multiple threads
 * Using a mutex to protect the variable
 *
 * GIlberto Echeverria
 * 2024-05-31
 */

#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>

#define REPETITIONS 1000000

// Structure to send data to the threads
typedef struct {
    int id;
    long * counter_ptr;
    pthread_mutex_t * mutex_ptr;
} thread_data_t;

// Function declarations
void * thread_func(void *);

int main(int argc, char* argv[])
{
    int num_threads = 4;
    int status;
    // Variable that will be used by all threads
    long counter = 0;
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

    if (argc == 2) {
        num_threads = atoi(argv[1]);
    }

    // Array to store the thread id's
    pthread_t tids[num_threads];
    // Array for the data to be sent to the threads
    thread_data_t data[num_threads];

    for(int i=0; i<num_threads; i++) {
        // Fill the data in the structure
        data[i].id = i;
        data[i].counter_ptr = &counter;
        data[i].mutex_ptr = &mutex;
        // pthread_create arguments:
        // - pointer to id variable
        // - pointer to thread options
        // - pointer to function
        // - pointer to funtion argument
        status = pthread_create(&tids[i], NULL, &thread_func, &data[i]);
        if (status == -1) {
            printf("Unable to create threads\n");
            exit(1);
        }
        printf("Created thread %d with id: %lu\n", i, tids[i]);
    }

    // Wait for the threads to finish
    for(int i=0; i<num_threads; i++) {
        status = pthread_join(tids[i], NULL);
        printf("Thread %d finished\n", i);
    }

    printf("FINAL VALUE: %ld (Expected %ld)\n", counter, (long) num_threads * REPETITIONS);


    return 0;
}

void * thread_func(void * args)
{
    thread_data_t * data = args;
    printf("This is thread %d\n", data->id);
    for (int x=0; x<REPETITIONS; x++) {
        pthread_mutex_lock(data->mutex_ptr);
            (*data->counter_ptr)++;
        pthread_mutex_unlock(data->mutex_ptr);
    }

    pthread_exit(NULL);
}
