<div align="center">

# PGC Experiment 02
## Multithreaded Programming with Pthreads & OpenMP

**Parallel and Grid Computing Laboratory**

<p>
  <img src="https://img.shields.io/badge/Language-C-1f6feb?style=for-the-badge&logo=c&logoColor=white">
  <img src="https://img.shields.io/badge/Pthreads-POSIX%20Threads-6f42c1?style=for-the-badge">
  <img src="https://img.shields.io/badge/OpenMP-Parallel%20Programming-2ea44f?style=for-the-badge">
  <img src="https://img.shields.io/badge/Platform-Ubuntu%20%2F%20WSL-orange?style=for-the-badge&logo=ubuntu&logoColor=white">
</p>

<p>
  <strong>Thread Creation • Work Sharing • Race Conditions • Synchronization • Performance Analysis</strong>
</p>

</div>

---

## 1. Experiment Overview

This experiment explores **multithreaded programming in C** using two major approaches:

- **Pthreads (POSIX Threads)** — explicit thread creation, argument passing, work partitioning, joining, and synchronization.
- **OpenMP** — directive-based parallel programming using parallel regions, work sharing, critical sections, barriers, and reduction.

The experiment progresses from basic thread creation to synchronization and finally to a performance study in which the same computational workload is executed sequentially and with different numbers of threads.

The repository is organized as a complete practical workflow rather than as isolated programs:

```text
Thread Creation
      ↓
Multiple Threads
      ↓
Work Distribution
      ↓
Race Condition
      ↓
Synchronization
      ↓
OpenMP Work Sharing
      ↓
Barrier / Reduction
      ↓
Performance Measurement
      ↓
Speedup & Efficiency Analysis
```

---

## 2. Aim

To develop and analyze multithreaded programs using **Pthreads and OpenMP**, understand thread-level parallelism and synchronization, and evaluate how execution time changes as the number of threads increases.

---

## 3. Objectives

The experiment focuses on the following objectives:

1. Create and execute threads using **Pthreads**.
2. Create multiple threads and pass data to individual threads.
3. Divide a computational task among multiple threads.
4. Observe the effect of a **race condition** on shared data.
5. eliminate race conditions using a **Pthread mutex**.
6. Create parallel regions using **OpenMP**.
7. Distribute loop iterations using OpenMP work sharing.
8. Protect shared updates using an OpenMP **critical section**.
9. Coordinate threads using an OpenMP **barrier**.
10. Use OpenMP **reduction** for safe parallel accumulation.
11. Measure sequential and multithreaded execution time.
12. Calculate and interpret **speedup and efficiency**.
13. Compare Pthreads and OpenMP behavior across different thread counts.

---

# 4. System Architecture

This experiment follows a shared-memory multithreading architecture in which a single process creates multiple execution threads that operate on a common address space.

```text
                         Multithreaded Program
                                  |
                    +-------------+-------------+
                    |                           |
                 Pthreads                    OpenMP
                    |                           |
          Explicit thread control       Compiler directives
                    |                           |
          +---------+---------+        +--------+---------+
          |                   |        |                  |
   Thread Creation      Synchronization  Parallel Region  Work Sharing
          |                   |        |                  |
   Work Partitioning   Mutex / Join     Critical / Barrier / Reduction
          |                   |        |                  |
          +-------------------+--------+------------------+
                              |
                       Shared Memory
                              |
                       Parallel Workload
                              |
                   Performance Measurement
                              |
                   Execution Time / Speedup
```

### Architectural Flow

1. The program initializes the workload.
2. The workload is divided among multiple threads.
3. Threads execute their assigned portions concurrently.
4. Shared data is synchronized whenever required.
5. Threads complete their work and results are combined.
6. Execution time is measured for performance analysis.
7. Pthreads and OpenMP results are compared against the sequential baseline.

### Programming Models

| Model | Control Style | Main Mechanism |
|---|---|---|
| Pthreads | Explicit | `pthread_create`, `pthread_join`, mutex |
| OpenMP | Directive-based | `parallel`, `parallel for`, `critical`, `barrier`, `reduction` |
| Sequential | Single execution flow | Standard C execution |

# Part A — Pthreads

## 5. Pthreads Implementation

Pthreads provides a low-level, explicit interface for creating and managing threads in C. The programs in this section progressively introduce the main mechanisms required for shared-memory multithreading.

### Program 1 — First Thread

**File:** `Programs/Pthreads/thread1.c`

Demonstrates the basic Pthread lifecycle:

```text
Create thread
     ↓
Execute thread function
     ↓
Join thread
     ↓
Continue main thread
```

Key functions:

- `pthread_create()`
- `pthread_join()`

---

### Program 2 — Multiple Threads

**File:** `Programs/Pthreads/thread2.c`

Creates four threads and passes a separate thread ID to each thread.

This demonstrates:

- Multiple simultaneous execution flows
- Passing arguments to a thread function
- Retrieving the thread ID
- Joining all created threads

---

### Program 3 — Divide Work Between Threads

**File:** `Programs/Pthreads/thread_sum.c`

The program divides an array into four equal sections. Each thread calculates the sum of one section and stores its result in a separate location.

```text
Array
[10 20] [30 40] [50 60] [70 80]
   ↓       ↓       ↓       ↓
 T1      T2      T3      T4
   \       |       |      /
       Partial Sums
             ↓
        Total Sum
```

This demonstrates explicit workload partitioning and aggregation of partial results.

---

### Program 4 — Race Condition

**File:** `Programs/Pthreads/race.c`

Multiple threads increment the same shared counter without synchronization.

The intended result is:

```text
Expected counter = 400000
```

Because multiple threads access and modify the same variable concurrently, the actual result can differ.

This illustrates the fundamental problem of **unsynchronized shared-memory access**.

---

### Program 5 — Fix Race Condition Using Mutex

**File:** `Programs/Pthreads/mutex.c`

The race condition is resolved using:

```c
pthread_mutex_lock(&mutex);
counter++;
pthread_mutex_unlock(&mutex);
```

The critical update is therefore executed by only one thread at a time.

Expected result:

```text
Expected counter = 400000
Actual counter   = 400000
```

This demonstrates **mutual exclusion** and safe access to shared data.

---

### Program 6 — Pthreads Performance

**File:** `Programs/Pthreads/pthread_perf.c`

The performance program divides a large numerical computation among a user-defined number of Pthreads.

Supported input range:

```text
1 to 32 threads
```

The program:

1. Accepts the number of threads.
2. Divides the workload into chunks.
3. Creates the requested number of threads.
4. Assigns each thread a range.
5. Executes the computation.
6. Joins all threads.
7. Combines partial results.
8. Reports execution time.

---

# Part B — OpenMP

## 6. OpenMP Implementation

OpenMP provides a higher-level model for shared-memory parallelism through compiler directives and runtime functions.

### Program 1 — Basic OpenMP

**File:** `Programs/OpenMP/omp1.c`

Introduces the OpenMP parallel region:

```c
#pragma omp parallel
```

Each participating thread prints its thread ID and the total number of threads.

---

### Program 2 — OpenMP Work Sharing

**File:** `Programs/OpenMP/omp_sum.c`

Uses:

```c
#pragma omp parallel for reduction(+:total_sum)
```

The loop iterations are distributed among threads and the partial results are safely combined.

This demonstrates:

- Parallel loop execution
- Automatic work distribution
- Reduction

---

### Program 3 — OpenMP Race Condition

**File:** `Programs/OpenMP/omp_race.c`

Multiple OpenMP threads increment the same shared counter without protection.

This reproduces the same synchronization problem observed with Pthreads, but using OpenMP.

---

### Program 4 — Fix Using OpenMP Critical

**File:** `Programs/OpenMP/omp_critical.c`

The shared counter update is protected using:

```c
#pragma omp critical
```

Only one thread can execute the protected region at a time.

---

### Program 5 — OpenMP Barrier

**File:** `Programs/OpenMP/omp_barrier.c`

A barrier is used to coordinate two stages of execution:

```text
Stage 1
  ↓
====================  Barrier  ====================
  ↓
Stage 2
```

No thread proceeds to Stage 2 until all participating threads reach the barrier.

---

### Program 6 — OpenMP Performance

**File:** `Programs/OpenMP/omp_perf.c`

The same large numerical workload used for Pthreads is parallelized with:

```c
#pragma omp parallel for reduction(+:sum)
```

The number of OpenMP threads can be selected at runtime from **1 to 32**.

---

# Part C — Performance Analysis

## 7. Benchmark Workload

The sequential and parallel performance programs operate on the same computational workload:

```text
N = 1,000,000,000 iterations
```

The computation performed in each iteration is:

```c
sum += (double)i * 0.000001;
```

The purpose is to keep the computational problem consistent while changing the execution model.

### Sequential baseline

**File:** `Programs/Performance/sequential.c`

Measured sequential execution time from the supplied result:

**2.710968 seconds**

This value is used as the baseline for the speedup calculations stored in the repository.

---

## 8. Performance Metrics

### Execution Time

The total time required to complete the workload.

Lower execution time indicates faster execution.

### Speedup

```text
Speedup = Sequential Time / Parallel Time
```

A larger speedup indicates a greater reduction in execution time compared with the sequential baseline.

### Efficiency

```text
Efficiency = Speedup / Number of Threads × 100
```

Efficiency indicates how effectively the available threads contribute to the observed speedup.

> The repository retains the measured values from the available results. Missing thread-count measurements are not artificially interpolated.

---

## 9. Measured Performance — Pthreads

| Threads | Execution Time (s) | Speedup |
|---:|---:|---:|
| 1 | 2.315791 | 1.171× |
| 2 | 1.313165 | 2.064× |
| 3 | 0.884921 | 3.064× |
| 4 | 1.194675 | 2.269× |
| 5 | 1.250780 | 2.167× |
| 6 | 1.053916 | 2.572× |
| 7 | 0.794706 | 3.411× |
| 9 | 0.870032 | 3.116× |
| 10 | 0.834768 | 3.248× |
| 11 | 0.812278 | 3.337× |
| 12 | 0.793988 | 3.414× |
| 13 | 0.773896 | 3.503× |
| 14 | 0.789038 | 3.436× |
| 15 | 0.761823 | **3.559×** |
| 16 | 0.767980 | 3.530× |

**Best observed Pthreads result:** 0.761823 s at 15 threads, corresponding to **3.559× speedup**.

> No 8-thread Pthreads value is present in the supplied measurements, so it is intentionally absent.

---

## 10. Measured Performance — OpenMP

| Threads | Execution Time (s) | Speedup |
|---:|---:|---:|
| 1 | 2.256370 | 1.201× |
| 2 | 1.221425 | 2.220× |
| 3 | 0.825444 | 3.284× |
| 4 | 0.694503 | 3.903× |
| 5 | 0.583439 | 4.647× |
| 6 | 0.489271 | 5.541× |
| 7 | 0.444641 | 6.097× |
| 8 | 0.394412 | **6.873×** |
| 9 | 0.453270 | 5.981× |
| 11 | 0.452297 | 5.994× |
| 12 | 0.416993 | 6.501× |
| 13 | 0.429116 | 6.318× |
| 14 | 0.432658 | 6.266× |
| 15 | 0.420606 | 6.445× |
| 16 | 0.421191 | 6.436× |

**Best observed OpenMP result:** 0.394412 s at 8 threads, corresponding to **6.873× speedup**.

> No 10-thread OpenMP value is present in the supplied measurements, so it is intentionally absent.

---

## 11. Best Observed Performance

| Implementation | Configuration | Execution Time | Speedup |
|---|---|---:|---:|
| Sequential | Baseline | 2.710968 s | 1.000× |
| Pthreads | 15 threads | 0.761823 s | 3.559× |
| OpenMP | 8 threads | **0.394412 s** | **6.873×** |

## 12. Performance Graphs

The repository contains three generated performance graphs.

### Execution Time

Shows how execution time changes with the number of threads.

![Execution Time](docs/graphs/01-execution-time.png)

### Speedup

Shows the speedup achieved relative to the sequential baseline.

![Speedup](docs/graphs/02-speedup.png)

### Efficiency

Shows the calculated efficiency for the recorded thread counts.

![Efficiency](docs/graphs/03-efficiency.png)

Detailed graph documentation is available in:

`docs/Three-Graphs.md`

---

## 13. Performance Interpretation

### Pthreads

Pthreads provides explicit control over:

- Thread creation
- Thread arguments
- Work partitioning
- Thread joining
- Synchronization

The best observed Pthreads execution time is **0.761823 seconds at 15 threads**.

Beyond the best point, increasing the number of threads does not guarantee additional improvement. Thread-management overhead and system scheduling can affect the measured result.

### OpenMP

OpenMP achieves a lower best observed execution time in this workload.

The best recorded result is:

```text
Threads          : 8
Execution time   : 0.394412 s
Speedup           : 6.873×
```

After the 8-thread result, execution time fluctuates rather than decreasing monotonically. This demonstrates that increasing thread count does not automatically produce proportional performance gains.

### Important observation about the 1-thread results

The measured one-thread Pthreads/OpenMP executions are not identical to the separately measured sequential baseline. Therefore, speedup values above 1× at one thread should be interpreted as **measurement differences between the benchmark programs**, not as evidence of parallel acceleration with one thread.

---

# 14. Results Demonstration

## Part A — Pthreads

### First Thread

![First Thread](Results/Part%20A%20-%20Pthreads/1-FIRST%20THREAD.jpg)

### Multiple Threads

![Multiple Threads](Results/Part%20A%20-%20Pthreads/2-MULTIPLE%20THREADS.jpg)

### Divide Work Between Threads

![Divide Work](Results/Part%20A%20-%20Pthreads/3-DIVIDE%20WORK%20BETWEEN%20THREADS.jpg)

### Race Condition

![Pthreads Race Condition](Results/Part%20A%20-%20Pthreads/4-RACE%20CONDITION.jpg)

### Race Condition Fixed Using Mutex

![Pthreads Mutex](Results/Part%20A%20-%20Pthreads/5-FIX%20RACE%20CONDITION%20USING%20MUTEX.jpg)

---

## Part B — OpenMP

### Basic OpenMP Program

![Basic OpenMP](Results/Part%20B%20-%20OpenMP/1-BASIC%20OPENMP%20PROGRAM.jpg)

### OpenMP Work Sharing

![OpenMP Work Sharing](Results/Part%20B%20-%20OpenMP/2-OPENMP%20WORK%20SHARING.jpg)

### OpenMP Race Condition

![OpenMP Race Condition](Results/Part%20B%20-%20OpenMP/3-OPENMP%20RACE%20CONDITION.jpg)

### OpenMP Critical Section

![OpenMP Critical](Results/Part%20B%20-%20OpenMP/4-FIX%20USING%20OPENMP%20CRITICAL.jpg)

### OpenMP Barrier

![OpenMP Barrier](Results/Part%20B%20-%20OpenMP/5-OPENMP%20BARRIER.jpg)

---

## Part C — Performance Analysis

### Sequential Baseline

![Sequential Baseline](Results/Part%20C%20-%20Performance%20Analysis/1-SEQUENTIAL%20BASELINE.jpg)

### Pthreads Performance

![Pthreads Performance](Results/Part%20C%20-%20Performance%20Analysis/2-PTHREADS%20PERFORMANCE.jpg)

### Different Pthread Thread Counts

![Pthread Thread Counts](Results/Part%20C%20-%20Performance%20Analysis/2-RUN%20PTHREADS%20WITH%20DIFFERENT%20THREAD%20COUNTS.jpg)

---

# 15. Repository Structure

```text
PGC-Experiment-02-Multithreaded_Pthreads_OpenMP-main/
│
├── README.md
│
├── Programs/
│   │
│   ├── Pthreads/
│   │   ├── thread1.c
│   │   ├── thread2.c
│   │   ├── thread_sum.c
│   │   ├── race.c
│   │   ├── mutex.c
│   │   └── pthread_perf.c
│   │
│   ├── OpenMP/
│   │   ├── omp1.c
│   │   ├── omp_sum.c
│   │   ├── omp_race.c
│   │   ├── omp_critical.c
│   │   ├── omp_barrier.c
│   │   └── omp_perf.c
│   │
│   └── Performance/
│       └── sequential.c
│
├── Results/
│   ├── Part A - Pthreads/
│   ├── Part B - OpenMP/
│   └── Part C - Performance Analysis/
│
└── docs/
    ├── Speedup.md
    ├── Efficiency.md
    ├── Three-Graphs.md
    ├── actual_results.csv
    └── graphs/
        ├── 01-execution-time.png
        ├── 02-speedup.png
        └── 03-efficiency.png
```

---

# 16. Environment & Requirements

The programs are designed for a Linux/Ubuntu environment and can also be executed through **WSL Ubuntu**.

### Required software

| Requirement | Purpose |
|---|---|
| GCC | C compilation |
| Pthreads | POSIX thread programming |
| OpenMP | Shared-memory parallel programming |
| Ubuntu / WSL | Linux execution environment |
| Terminal | Compilation and execution |

Check GCC:

```bash
gcc --version
```

Check OpenMP support:

```bash
gcc --version
```

---

# 17. Compilation & Execution

## Pthreads

Move to the Pthreads directory:

```bash
cd Programs/Pthreads
```

Compile:

```bash
gcc thread1.c -o thread1 -pthread
gcc thread2.c -o thread2 -pthread
gcc thread_sum.c -o thread_sum -pthread
gcc race.c -o race -pthread
gcc mutex.c -o mutex -pthread
gcc pthread_perf.c -o pthread_perf -pthread
```

Run examples:

```bash
./thread1
./thread2
./thread_sum
./race
./mutex
./pthread_perf
```

For the performance program, enter a thread count between **1 and 32** when prompted.

Example:

```text
Enter number of threads: 8
```

---

## OpenMP

Move to the OpenMP directory:

```bash
cd Programs/OpenMP
```

Compile:

```bash
gcc omp1.c -o omp1 -fopenmp
gcc omp_sum.c -o omp_sum -fopenmp
gcc omp_race.c -o omp_race -fopenmp
gcc omp_critical.c -o omp_critical -fopenmp
gcc omp_barrier.c -o omp_barrier -fopenmp
gcc omp_perf.c -o omp_perf -fopenmp
```

Run:

```bash
./omp1
./omp_sum
./omp_race
./omp_critical
./omp_barrier
./omp_perf
```

For the performance program:

```text
Enter number of threads: 8
```

---

## Sequential Baseline

Move to:

```bash
cd Programs/Performance
```

Compile:

```bash
gcc sequential.c -o sequential
```

Run:

```bash
./sequential
```

---

# 18. Conclusion

This experiment demonstrates the practical foundations of **shared-memory multithreaded programming** using both Pthreads and OpenMP.

Pthreads provides fine-grained control over thread creation, argument passing, work partitioning, joining, and mutex-based synchronization. OpenMP provides a more concise directive-based approach for expressing parallel regions, work sharing, critical sections, barriers, and reductions.

The experiments also demonstrate why synchronization is essential when multiple threads access shared data. The race-condition programs show the problem, while the mutex and critical-section implementations provide controlled solutions.

From the measured performance results, the best observed Pthreads execution time was **0.761823 seconds at 15 threads**, while the best observed OpenMP execution time was **0.394412 seconds at 8 threads**. The OpenMP result therefore achieved the lowest recorded execution time and the highest observed speedup of **6.873×** for this workload.

Most importantly, the experiment shows that parallel performance is not determined by thread count alone. Thread-management overhead, workload distribution, synchronization, and system scheduling all influence the final execution time. Performance analysis is therefore an essential part of evaluating a parallel program.

---

<div align="left">

## Author

**Rakshita L Kademani**

**PGC Experiment 02 — Multithreaded Programming with Pthreads & OpenMP**

</div>
