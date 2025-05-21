`ls ./*/*.csv`.split("\n").each { |file| 

  year = file.split("/")[1]
  date = file.split("/")[2].split(".")[0]

  `mkdir -p fig/#{year}`
  open("data.csv", "w")
  `cp ./#{year}/#{date}.csv data.csv`
  `gnuplot plot.gp`
  `mv data.svg #{date}.svg`
  `mv #{date}.svg ./fig/#{year}`
}