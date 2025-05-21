`ls ./*.txt`.split("\n").each { |file|
    name = nil
    year_month = nil
    total_minutes = 0
    #ファイル名から名前、年月を取得
    if file =~ /kinmu_(\w+)(\d{4})_(\d{2})[A-Za-z]+\.txt/
        name = $1
        year_month = "#{$2}-#{$3}"
    end

    open(file) { |file|
        total_minutes = 0
        file.each_line { |line|
            start_time, end_time = line.split[1, 2]

            #00:00の形式以外を通さない
            if start_time == nil || end_time == nil
                next
            end
            
            if start_time&.include?(":") == false
                next
            end
              
            if end_time&.include?(":") == false
                next
            end

            start_hour, start_min = start_time.split(":")
            end_hour, end_min = end_time.split(":")

            #合計時間をminに変更
            total_minutes += (end_hour.to_i * 60 + end_min.to_i) - (start_hour.to_i * 60 + start_min.to_i)
        }
    }
    puts "#{name} #{year_month} #{total_minutes / 60}h #{total_minutes % 60}min"
}