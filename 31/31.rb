require 'date'

firstday = Date.parse("2025-04-24")
today = Date.today

days = (today - firstday).to_i

puts "#{firstday}から#{today}までの暦日数は#{days}日"