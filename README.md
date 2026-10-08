# ⚡ Multithreaded Programming Using Pthreads & OpenMP

> **Experiment 02 | Performance Analysis**

A practical implementation of multithreading using **POSIX Threads (Pthreads)** and **OpenMP**, covering thread creation, work distribution, race conditions, synchronization, and performance evaluation.

---

## 🎯 Objectives

- Create and manage multiple threads using **Pthreads**
- Implement parallel regions and work sharing using **OpenMP**
- Understand **race conditions** and synchronization
- Compare sequential and multithreaded execution
- Calculate **speedup** and **efficiency** using measured results

---

## 🧩 Technologies Used

| Technology | Purpose |
|---|---|
| 🐧 Ubuntu / WSL | Execution environment |
| 🧵 Pthreads | Explicit thread management |
| ⚙️ OpenMP | High-level parallel programming |
| 💻 GCC | Compilation |
| 📝 C | Implementation language |

---

## 📁 Repository Structure

```text
Programs/
├── Pthreads/
├── OpenMP/
└── Performance/

Results/
├── Part A - Pthreads/
├── Part B - OpenMP/
└── Part C - Performance Analysis/

docs/
├── 22-SPEEDUP.md
├── 23-EFFICIENCY.md
├── 24-THREE-GRAPHS.md
└── actual_results.csv
```

---

## 🧵 Part A — Pthreads

The Pthreads section demonstrates:

- Single-thread creation
- Multiple-thread creation
- Dividing work among threads
- Shared-data race conditions
- Mutex-based synchronization
- Performance testing with different thread counts

### Key Functions

```c
pthread_create()
pthread_join()
pthread_mutex_lock()
pthread_mutex_unlock()
```

---

## ⚙️ Part B — OpenMP

The OpenMP section demonstrates:

- Basic parallel regions
- Work sharing
- Parallel summation
- Race conditions
- Critical sections
- Barriers
- Performance testing

### Key Directives

```c
#pragma omp parallel
#pragma omp parallel for
#pragma omp critical
#pragma omp barrier
#pragma omp reduction
```

---

## 📈 Part C — Performance Analysis

The performance section compares:

**Sequential → Pthreads → OpenMP**

All performance calculations are based on the **actual execution results obtained during the experiment**.

### Sequential Baseline

**Execution time:** `2.710968 seconds`

**Result:**

```text
499999999500.00
```

---

## 🧮 Performance Metrics

### Speedup

```text
Speedup = Sequential Time / Parallel Time
```

Speedup measures how much faster a parallel implementation is compared with the sequential baseline.

See [`22-SPEEDUP.md`](22-SPEEDUP.md) for the complete calculation table.

### Efficiency

```text
Efficiency = (Speedup / Number of Threads) × 100
```

Efficiency indicates how effectively the available threads are being utilized.

See [`23-EFFICIENCY.md`](23-EFFICIENCY.md) for the complete calculation table.

---

## 🔍 Performance Observations

The measured results show that increasing the number of threads can reduce execution time, but the improvement is **not perfectly linear**.

This occurs because parallel execution introduces overhead from:

- Thread creation and management
- Scheduling
- Memory access
- Synchronization
- Operating-system activity
- Work distribution

Therefore, the highest thread count does not automatically guarantee the shortest execution time.

---

## 🆚 Pthreads vs OpenMP

| Feature | Pthreads | OpenMP |
|---|---|---|
| Thread creation | Explicit | Directive-based |
| Work distribution | Programmer-managed | Runtime-managed |
| Synchronization | Mutex, join, etc. | Critical, barrier, reduction |
| Programming effort | Higher | Lower |
| Control | Fine-grained | Higher-level |
| Ease of implementation | Moderate | Easier |

---

## 🧠 Learning Flow

```text
Threads
   ↓
Parallel Work
   ↓
Shared Data
   ↓
Race Conditions
   ↓
Synchronization
   ↓
Performance Measurement
   ↓
Speedup
   ↓
Efficiency
   ↓
Final Comparison
```

---

## 📂 Documentation

| File | Purpose |
|---|---|
| [`22-SPEEDUP.md`](22-SPEEDUP.md) | Actual speedup calculations |
| [`23-EFFICIENCY.md`](23-EFFICIENCY.md) | Actual efficiency calculations |
| [`24-THREE-GRAPHS.md`](24-THREE-GRAPHS.md) | Step 24 documentation |
| [`actual_results.csv`](actual_results.csv) | Actual measured performance data |

---

## ✅ Experiment Status

| Section | Status |
|---|---|
| Part A — Pthreads | ✅ Completed |
| Part B — OpenMP | ✅ Completed |
| Sequential Baseline | ✅ Completed |
| Pthreads Performance | ✅ Completed |
| OpenMP Performance | ✅ Completed |
| Speedup Calculation | ✅ Completed |
| Efficiency Calculation | ✅ Completed |

---

## 🏁 Conclusion

This experiment provided practical experience with **multithreaded programming using Pthreads and OpenMP**.

Pthreads demonstrated explicit control over thread creation, work distribution, and synchronization, while OpenMP provided a simpler directive-based approach to parallel execution.

The performance analysis demonstrates that parallel execution can reduce execution time for suitable workloads. However, performance does not increase linearly with thread count because of thread-management, scheduling, synchronization, and memory-access overhead.

---

<div align="center">

### 🚀 Multithreading • Parallelism • Performance

**PGC — Experiment 02**

</div>
