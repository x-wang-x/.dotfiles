#!/bin/bash

# Ambil sampel statistik CPU pertama secara akurat berdasarkan nama kolom
eval $(awk '/^cpu / {printf "prev_idle=%d; prev_total=%d", $5+$6, $2+$3+$4+$5+$6+$7+$8}' /proc/stat)

# Jeda 1 detik untuk menangkap selisih beban kerja
sleep 1

# Ambil sampel statistik CPU kedua
eval $(awk '/^cpu / {printf "idle=%d; total=%d", $5+$6, $2+$3+$4+$5+$6+$7+$8}' /proc/stat)

# Hitung selisih dan konversi menjadi rata-rata persentase semua core
diff_idle=$((idle - prev_idle))
diff_total=$((total - prev_total))
cpu_usage=$(awk "BEGIN {printf \"%.0f\", (($diff_total - $diff_idle) / $diff_total) * 100}")

# Hitung penggunaan RAM (menggunakan free)
mem_usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

# Output hasil gabungan ke Waybar
echo " ${cpu_usage}%  ${mem_usage}%"

