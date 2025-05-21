open('survo.dat', 'w') { |f|
    20.times{|i|
        x = i / 19.0
        y = 180 * x
        f.puts "#{x} #{y}"
    }
}

`gnuplot -persist plot.gp`