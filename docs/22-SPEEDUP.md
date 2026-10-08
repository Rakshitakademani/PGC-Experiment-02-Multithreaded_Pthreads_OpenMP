SPEEDUP CALCUATION

## Formula

```text
Speedup = Sequential Time / Parallel Time
```

Sequential baseline from the supplied screenshot: **2.710968 seconds**.

Only execution times visible in the supplied screenshots are used below. No missing thread-count values are estimated.

## Pthreads speedup

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
| 15 | 0.761823 | 3.559× |
| 16 | 0.767980 | 3.530× |

## OpenMP speedup

| Threads | Execution Time (s) | Speedup |
|---:|---:|---:|
| 1 | 2.256370 | 1.201× |
| 2 | 1.221425 | 2.220× |
| 3 | 0.825444 | 3.284× |
| 4 | 0.694503 | 3.903× |
| 5 | 0.583439 | 4.647× |
| 6 | 0.489271 | 5.541× |
| 7 | 0.444641 | 6.097× |
| 8 | 0.394412 | 6.873× |
| 9 | 0.453270 | 5.981× |
| 11 | 0.452297 | 5.994× |
| 12 | 0.416993 | 6.501× |
| 13 | 0.429116 | 6.318× |
| 14 | 0.432658 | 6.266× |
| 15 | 0.420606 | 6.445× |
| 16 | 0.421191 | 6.436× |

### Best observed speedup
- Pthreads: **3.559×** at **15 threads**.
- OpenMP: **6.873×** at **8 threads**.

> Note: The manual's sample values (such as 9.62× for OpenMP at 16 threads) are not used here. 
