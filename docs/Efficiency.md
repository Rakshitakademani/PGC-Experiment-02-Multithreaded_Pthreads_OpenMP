# EFFICIENCY

## Formula

```text
Efficiency = Speedup / Number of Threads × 100
```

Sequential baseline used: **2.710968 seconds**.

## Pthreads efficiency

| Threads | Speedup | Efficiency (%) |
|---:|---:|---:|
| 1 | 1.171× | 117.06% |
| 2 | 2.064× | 103.22% |
| 3 | 3.064× | 102.12% |
| 4 | 2.269× | 56.73% |
| 5 | 2.167× | 43.35% |
| 6 | 2.572× | 42.87% |
| 7 | 3.411× | 48.73% |
| 9 | 3.116× | 34.62% |
| 10 | 3.248× | 32.48% |
| 11 | 3.337× | 30.34% |
| 12 | 3.414× | 28.45% |
| 13 | 3.503× | 26.95% |
| 14 | 3.436× | 24.54% |
| 15 | 3.559× | 23.72% |
| 16 | 3.530× | 22.06% |

## OpenMP efficiency

| Threads | Speedup | Efficiency (%) |
|---:|---:|---:|
| 1 | 1.201× | 120.15% |
| 2 | 2.220× | 110.98% |
| 3 | 3.284× | 109.48% |
| 4 | 3.903× | 97.59% |
| 5 | 4.647× | 92.93% |
| 6 | 5.541× | 92.35% |
| 7 | 6.097× | 87.10% |
| 8 | 6.873× | 85.92% |
| 9 | 5.981× | 66.45% |
| 11 | 5.994× | 54.49% |
| 12 | 6.501× | 54.18% |
| 13 | 6.318× | 48.60% |
| 14 | 6.266× | 44.76% |
| 15 | 6.445× | 42.97% |
| 16 | 6.436× | 40.23% |

### Highest observed efficiency
- Pthreads: **117.06%** at **1 thread(s)**.
- OpenMP: **120.15%** at **1 thread(s)**.

> Missing thread counts remain missing; no values were interpolated or copied from the manual.
