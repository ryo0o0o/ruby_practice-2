open('survosigmoid.dat', 'w') { |f|
    20.times{|i|
        x = i / 19.0
        y = 180 / (1 + Math::exp((-x + 0.5)* 20))
        f.puts "#{x} #{y}"
    }
}

`gnuplot -persist plot_sig.gp`