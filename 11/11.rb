data = [
  ["2025-02-22", "book", 3000],
  ["2025-04-29", "kosai", 6000],
  ["2025-12-31", "taxi", 2000],
  ["2025-04-27", "book", 4000],
  ["2025-05-22", "kosai", 7000],
  ["2025-05-04", "kosai", 5000]
]

monthly = {}
category = {}
monthly_category = {}

data.each {|date, cat, cos|

  mon = date[/^[^-]+-[^-]+/]
  mon_cat = mon + ", " + cat

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

#key毎にsortして出力
puts "月毎"
monthly.keys.sort.each { |key| puts "#{key}: #{monthly[key]}" }
puts "\n科目毎"
category.keys.sort.each { |key| puts "#{key}: #{category[key]}" }
puts "\n月＋科目毎"
monthly_category.keys.sort.each { |key| puts "#{key}: #{monthly_category[key]}" }