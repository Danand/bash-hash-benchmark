#!/bin/bash

algo="$1"
iterations="$2"
file_size="$3"

if [ -z "${file_size}" ]; then
  file_size=104857600
fi

cat /dev/urandom | head -c $file_size > dummy-data.bytes

elapsed_time_total=0

for _ in $(seq 1 $iterations); do
  start_time=$(date +%s%N)

  $algo dummy-data.bytes > /dev/null

  end_time=$(date +%s%N)
  elapsed_time="$(( (end_time - start_time) ))"
  elapsed_time_total=$(( elapsed_time_total + elapsed_time ))
done

elapsed_time_total_ms=$(( elapsed_time_total / 1000000 ))

echo -e "${algo}\t$elapsed_time_total_ms"

rm -f dummy-data.bytes
