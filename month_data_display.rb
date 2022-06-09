module MonthDataDisplay

  def MonthDataDisplay.month_data_display(city, date)

    require 'colorize'

    high_temp_data = Array.new
    low_temp_data = Array.new
    high_and_low_max_temp = Array.new
    high_and_low_min_temp = Array.new

    File.readlines("#{city}").each do |line|
    data_line = line.split(',')
    high_temp_data.append(data_line[1].to_i)
    low_temp_data.append(data_line[3].to_i)
    end

    high_temp_data.shift
    low_temp_data.shift

    high_and_low_max_temp = high_temp_data.minmax
    high_and_low_min_temp = low_temp_data.minmax

    puts date

    print "#{high_and_low_max_temp[0]} "
    puts " #{high_and_low_max_temp[1].times {print "+".red}}C"

    print "#{high_and_low_min_temp[0]} "
    puts " #{high_and_low_min_temp[1].times {print "+".blue}}C"

    puts("")
    puts "Bonus Task"

    month_size = high_temp_data.size
    puts date
    (1..month_size).to_a.each do |day|
      print "#{day} "
      low_temp_data[day-1].times {print "+".blue}
      high_temp_data[day-1].times {print "+".red}
      puts " #{low_temp_data[day-1]} - #{high_temp_data[day-1]}C"

    end

  end

end
