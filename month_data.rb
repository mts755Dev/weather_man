module MonthData

  def MonthData.month_data(city)

    avg_max_temperature = 0
    avg_min_temperature = 0
    avg_humidity = 0
    avg_high_temp_data = Array.new
    avg_low_temp_data = Array.new
    avg_humid_data = Array.new


    File.readlines("#{city}").each do |line|
      data_line = line.split(',')
      avg_high_temp_data.append(data_line[1].to_i)
      avg_low_temp_data.append(data_line[3].to_i)
      avg_humid_data.append(data_line[7].to_i)
    end

    avg_max_temperature = avg_high_temp_data.sum / avg_high_temp_data.size
    avg_min_temperature = avg_low_temp_data.sum / avg_low_temp_data.size
    avg_humidity = avg_humid_data.sum / avg_humid_data.size

    puts "Highest Average: #{avg_max_temperature}C"
    puts "Lowest Average: #{avg_min_temperature}C"
    puts "Average Humidity: #{avg_humidity}%"

  end

end
