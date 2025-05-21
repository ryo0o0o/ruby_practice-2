#完成
monthly = {}
category = {}
monthly_category = {}
array = []

open('data.csv', 'r') {|file|
  file.each_line { |line|
    date, cat, cos = line.chomp.split(',')
    cos = cos.to_i
    mon = date[/^[^-]+-[^-]+/]
    mon_cat = mon + ", " + cat
    array.push([date, cat, cos])

    #それぞれのkey毎の費用を合計
    if monthly[mon] == nil
      monthly[mon] = cos
    else 
      monthly[mon] += cos
    end

    if category[cat] == nil
      category[cat] = cos
    else 
      category[cat] += cos
    end

    if monthly_category[mon_cat] == nil
      monthly_category[mon_cat] = cos
    else 
      monthly_category[mon_cat] += cos
    end
  }
  file.close
}

#key毎にsortして出力
open('result.txt', 'w') {|f|
  f.puts "月毎"
  monthly.keys.sort.each { |key| f.puts "#{key}: #{monthly[key]}" }
  f.puts "\n科目毎"
  category.keys.sort.each { |key| f.puts "#{key}: #{category[key]}" }
  f.puts "\n月＋科目毎"
  monthly_category.keys.sort.each { |key| f.puts "#{key}: #{monthly_category[key]}" }
  f.close
}