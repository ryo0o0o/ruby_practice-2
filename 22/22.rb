temp = []
humi = []
co2 = []

temp_stat = []
humi_stat = []
co2_stat = []

month = []
count = 0
last_year = ""
last_month = ""

`ls ./*/*.csv`.split("\n").each { |file|
    year = file.split("/")[1]
    current_month = file.split("/")[2].split(".")[0][0,2]
    month.push(current_month)

    #月変更の分岐
    if count == 0 || current_month == month[count - 1]

        open(file, 'r') { |f|
            f.each_line { |line|
                line = line.strip
                next if line.empty?
                fields = line.split(',')

                if fields[1].to_f >= 0 && fields[1].to_f <= 60 
                    temp.push(fields[1].to_f)
                end
                        
                if fields[2].to_f >= 0 && fields[2].to_f <= 100
                    humi.push(fields[2].to_f)
                end
                
                if fields[3].to_f >= 0 && fields[3].to_f <= 1500
                    co2.push(fields[3].to_f)
                end
            }
        }
        last_year = year
        last_month = current_month

    else
        #統計を記録
        temp_stat.push(["#{last_year}-#{last_month}", (temp.sum / temp.size).round(2), temp.max, temp.min, temp.sort.size.odd? ? temp.sort[temp.sort.size / 2] : (temp.sort[temp.sort.size / 2 - 1] + temp.sort[temp.sort.size / 2]) / 2.0])
        humi_stat.push(["#{last_year}-#{last_month}", (humi.sum / humi.size).round(2), humi.max, humi.min, humi.sort.size.odd? ? humi.sort[humi.sort.size / 2] : (humi.sort[humi.sort.size / 2 - 1] + humi.sort[humi.sort.size / 2]) / 2.0])
        co2_stat.push(["#{last_year}-#{last_month}", (co2.sum / co2.size).round(2), co2.max, co2.min, co2.sort.size.odd? ? co2.sort[co2.sort.size / 2] : (co2.sort[co2.sort.size / 2 - 1] + co2.sort[co2.sort.size / 2]) / 2.0])

        temp = []
        humi = []
        co2 = []

        open(file, 'r') { |f|
            f.each_line { |line|
                line = line.strip
                next if line.empty?
                fields = line.split(',')

                if fields[1].to_f >= 0 && fields[1].to_f <= 60 
                    temp.push(fields[1].to_f)
                end
                        
                if fields[2].to_f >= 0 && fields[2].to_f <= 100
                    humi.push(fields[2].to_f)
                end
                
                if fields[3].to_f >= 0 && fields[3].to_f <= 1500
                    co2.push(fields[3].to_f)
                end
            }
        }

        last_year = year
        last_month = current_month
    end

    count += 1
}

# 最後の月の統計を記録
temp_stat.push(["#{last_year}-#{last_month}", (temp.sum / temp.size).round(2), temp.max, temp.min, temp.sort.size.odd? ? temp.sort[temp.sort.size / 2] : (temp.sort[temp.sort.size / 2 - 1] + temp.sort[temp.sort.size / 2]) / 2.0])
humi_stat.push(["#{last_year}-#{last_month}", (humi.sum / humi.size).round(2), humi.max, humi.min, humi.sort.size.odd? ? humi.sort[humi.sort.size / 2] : (humi.sort[humi.sort.size / 2 - 1] + humi.sort[humi.sort.size / 2]) / 2.0])
co2_stat.push(["#{last_year}-#{last_month}", (co2.sum / co2.size).round(2), co2.max, co2.min, co2.sort.size.odd? ? co2.sort[co2.sort.size / 2] : (co2.sort[co2.sort.size / 2 - 1] + co2.sort[co2.sort.size / 2]) / 2.0])

puts "Monthly Temperature\nYear-Mon, ave, max, min, med:"
temp_stat.each { |row| puts row.join(", ") }

puts "\nMonthly Humidity\nYear-Mon, ave, max, min, med:"
humi_stat.each { |row| puts row.join(", ") }

puts "\nMonthly CO2\nYear-Mon, ave, max, min, med:"
co2_stat.each { |row| puts row.join(", ") }