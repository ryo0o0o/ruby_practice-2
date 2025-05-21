set title "サーボモーターの角度" font("Arial,20")
set xlabel "[0-1]"
set ylabel "角度[deg]"
set yrange [0:180]
set ytics 30
set terminal qt
plot 'survocos.dat' w lp