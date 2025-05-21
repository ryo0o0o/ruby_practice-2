set terminal svg size 800,600
set datafile separator ","
set output "data.svg"
set ylabel "Temperature / Humidity"
set y2label "CO2[ppm]"
set grid
set yrange[0:120]
set y2range [400:1600]
#軸毎に仮の値設定
set ytics ("25C 100%%" 100,"20C 80%%" 80, "15C 60%%" 60, "10C 40%%" 40, "5C 20%%" 20, "0C 0%%" 0)
set y2tics
set xdata time
set timefmt "%H:%M:%S"
set format x "%H:%M"

#気温が仮の値に合うように4倍する
plot \
  "data.csv" using 1:($2 >= 0 && $2 <= 60 ? $2 * 4 : 1/0) w l title "Temperature" axes x1y1, \
  "data.csv" using 1:($3 >= 0 && $3 <= 100 ? $3 : 1/0) w l title "Humidity" axes x1y1, \
  "data.csv" using 1:($4 >= 0 && $4 <= 4000 ? $4 : 1/0) w l title "CO2" axes x1y2