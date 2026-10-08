CC=gcc
CFLAGS=-Wall -Wextra -O2

all: pthreads openmp sequential

pthreads:
	$(CC) $(CFLAGS) Programs/Pthreads/thread1.c -o thread1 -pthread
	$(CC) $(CFLAGS) Programs/Pthreads/thread2.c -o thread2 -pthread
	$(CC) $(CFLAGS) Programs/Pthreads/thread_sum.c -o thread_sum -pthread
	$(CC) $(CFLAGS) Programs/Pthreads/race.c -o race -pthread
	$(CC) $(CFLAGS) Programs/Pthreads/mutex.c -o mutex -pthread
	$(CC) $(CFLAGS) Programs/Pthreads/pthread_perf.c -o pthread_perf -pthread

openmp:
	$(CC) $(CFLAGS) Programs/OpenMP/omp1.c -o omp1 -fopenmp
	$(CC) $(CFLAGS) Programs/OpenMP/omp_sum.c -o omp_sum -fopenmp
	$(CC) $(CFLAGS) Programs/OpenMP/omp_race.c -o omp_race -fopenmp
	$(CC) $(CFLAGS) Programs/OpenMP/omp_critical.c -o omp_critical -fopenmp
	$(CC) $(CFLAGS) Programs/OpenMP/omp_barrier.c -o omp_barrier -fopenmp
	$(CC) $(CFLAGS) Programs/OpenMP/omp_perf.c -o omp_perf -fopenmp

sequential:
	$(CC) $(CFLAGS) Programs/Performance/sequential.c -o sequential

clean:
	rm -f thread1 thread2 thread_sum race mutex pthread_perf omp1 omp_sum omp_race omp_critical omp_barrier omp_perf sequential
