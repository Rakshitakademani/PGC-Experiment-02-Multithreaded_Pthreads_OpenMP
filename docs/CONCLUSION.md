# 23. CONCLUSION

The experiment demonstrates how multithreaded programs can be developed using Pthreads and OpenMP.

Pthreads provides explicit control over thread creation, joining, and mutex-based synchronization. OpenMP provides a higher-level programming model using parallel regions, work-sharing directives, critical sections, barriers, and reductions.

The experiments demonstrate that multiple threads can introduce race conditions when shared data is not protected. Synchronization mechanisms such as mutexes and critical sections are therefore necessary.

The performance experiment demonstrates that increasing the number of threads can reduce execution time for a suitable workload. Both Pthreads and OpenMP showed substantial reductions in execution time at suitable thread counts.

The graphs provide three complementary views:
- **Execution time** shows how long the computation takes.
- **Speedup** shows how much faster parallel execution is relative to the sequential baseline.
- **Efficiency** shows how effectively the available threads contribute to the measured speedup.

The measured results also show that speedup is not perfectly proportional to the number of threads because parallel execution introduces overhead such as scheduling, synchronization, memory access, thread management, and non-parallel work.

Overall learning flow:

**Create → Manage → Divide Work → Share Data → Handle Race Conditions → Synchronize → Coordinate → Measure Performance → Analyze Results**
