# Bash hash functions benchmark

## Results

### 100 MB file, 1 iteration

| Function | Time elapsed (ms.) |
|:--------|--------:|
| `openssl dgst -sha1` | 406 |
| `b2sum` | 427 |
| `md5sum`| 573 |
| `openssl dgst -md5` | 583 |
| `openssl dgst -sha512` | 529 |
| `sha1sum` | 678 |
| `openssl dgst -sha256` | 733 |
| `sha384sum` | 872 |
| `sha512sum` | 872 |
| `sha224sum` | 1354 |
| `sha256sum` | 1362 |

### 100 MB file, 10 iterations

| Function | Time elapsed (ms.) |
|:--------|--------:|
| `openssl dgst -sha1` | 4006 |
| `b2sum` | 4277 |
| `openssl dgst -md5` | 5086 |
| `openssl dgst -sha512` | 5170 |
| `md5sum` | 5249 |
| `sha1sum` | 5882 |
| `openssl dgst -sha256` | 7278 |
| `sha512sum` | 8452 |
| `sha384sum` | 8521 |
| `sha256sum` | 13423 |
| `sha224sum` | 13446 |

### 100 MB file, 100 iterations

| Function | Time elapsed (ms.) |
|:--------|--------:|
| `openssl dgst -sha1` | 38553 |
| `b2sum` | 42591 |
| `openssl dgst -md5` | 49940 |
| `md5sum` | 50033 |
| `openssl dgst -sha512` | 51910 |
| `sha1sum` | 57393 |
| `openssl dgst -sha256` | 71788 |
| `sha512sum` | 84725 |
| `sha384sum` | 84855 |
| `sha256sum` | 134613 |
| `sha224sum` | 132943 |

## How to run benchmark

```bash
algos=( \
  "md5sum" \
  "sha1sum" \
  "sha224sum" \
  "sha256sum" \
  "sha384sum" \
  "sha512sum" \
  "b2sum" \
  "openssl dgst -md5" \
  "openssl dgst -sha1" \
  "openssl dgst -sha256" \
  "openssl dgst -sha512" \
)

for algo in "${algos[@]}"; do
  ./hash-benchmark.sh \
    "${algo}" \
    10 \
    104857600
done \
| sort -t $'\t' -k 2 -n \
| column -s $'\t' -t
```
