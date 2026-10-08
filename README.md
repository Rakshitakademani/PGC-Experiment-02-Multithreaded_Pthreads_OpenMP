# PGC Experiment 02 — Multithreaded Programming Using Pthreads and OpenMP

## Aim
Develop multithreaded programs using **Pthreads** and **OpenMP** and study thread creation, work distribution, race conditions, synchronization, coordination, and performance.

## Environment
- Windows host with WSL Ubuntu
- GCC
- POSIX Threads (Pthreads)
- OpenMP
- Terminal / Nano

## Repository Structure

```text
PGC-Experiment-02-Multithreaded_Pthreads_OpenMP/
├── README.md
├── Makefile
├── Programs/
│   ├── Pthreads/
│   │   ├── thread1.c
│   │   ├── thread2.c
│   │   ├── thread_sum.c
│   │   ├── race.c
│   │   ├── mutex.c
│   │   └── pthread_perf.c
│   ├── OpenMP/
│   │   ├── omp1.c
│   │   ├── omp_sum.c
│   │   ├── omp_race.c
│   │   ├── omp_critical.c
│   │   ├── omp_barrier.c
│   │   └── omp_perf.c
│   └── Performance/
│       └── sequential.c
├── Results/
│   ├── Part A - Pthreads/
│   ├── Part B - OpenMP/
│   └── Part C - Performance Analysis/
│       ├── Graphs/
│       ├── performance_results.csv
│       └── PERFORMANCE-ANALYSIS.md
└── docs/
    ├── 22-COMPLETE-LEARNING-FLOW.md
    ├── 23-CONCLUSION.md
    └── 24-FINAL-SUBMISSION.md
```

## Compilation

### Pthreads

```bash
gcc thread1.c -o thread1 -pthread
gcc thread2.c -o thread2 -pthread
gcc thread_sum.c -o thread_sum -pthread
gcc race.c -o race -pthread
gcc mutex.c -o mutex -pthread
gcc pthread_perf.c -o pthread_perf -pthread
```

### OpenMP

```bash
gcc omp1.c -o omp1 -fopenmp
gcc omp_sum.c -o omp_sum -fopenmp
gcc omp_race.c -o omp_race -fopenmp
gcc omp_critical.c -o omp_critical -fopenmp
gcc omp_barrier.c -o omp_barrier -fopenmp
gcc omp_perf.c -o omp_perf -fopenmp
```

### Sequential performance

```bash
gcc sequential.c -o sequential
./sequential
```

> If `sequential` already exists as a directory, use another executable name such as `sequential_program`.

## Performance Result Summary

Sequential baseline measured in the supplied screenshot: **2.710968 s**.

The measured Pthreads and OpenMP values used in the report are taken from the supplied screenshots. The Pthreads 8-thread execution time is not visible in the supplied screenshots, so it is left blank rather than invented.

The OpenMP measurements are available for 1–16 threads. See `Results/Part C - Performance Analysis/PERFORMANCE-ANALYSIS.md`.

## Learning Outcomes
- Create and join Pthreads.
- Divide work among threads.
- Observe race conditions.
- Protect shared data with a mutex.
- Create OpenMP parallel regions.
- Use OpenMP work sharing, critical sections, barriers, and reduction.
- Measure sequential and parallel execution time.
- Calculate speedup and efficiency.
- Interpret performance as thread count changes.

## Final Sections
The manual's **22. COMPLETE LEARNING FLOW** and **23. CONCLUSION** are included under `docs/`.
A repository-specific **24. FINAL SUBMISSION** document has also been included to complete the GitHub submission package. The supplied manual itself ends at section 23.
