open('survocos.dat', 'w') { |f|
    20.times{|i|
        x = i / 19.0
        y = 90 * Math.cos(Math::PI * (x - 1)) + 90
        f.puts "#{x} #{y}"
    }
}

`gnuplot -persist plot_cos.gp`