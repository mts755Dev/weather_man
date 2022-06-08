module WeatherMan

  def WeatherMan.start

    input_array = ARGV
    tag = input_array[0]

    case tag

    when '-e'

      year = input_array[1]
      city = input_array[2].split('/').last
      year_data(year,city)

    when '-a'

      file_name = input_array[2].split('/').last
      city = input_array[2].split(' ').join
      a = city.slice! "/"
      month_data(city)

    when '-c'

      month_num = input_array[1].split('/').last
      req_year = input_array[1].split('/').first
      req_month =  get_month(month_num)
      date = "#{req_month} #{req_year}"
      city = input_array[2].split(' ').join
      a = city.slice! "/"
      month_data_display(city,date)

    else
      exit

    end

  end

  def WeatherMan.year_data(year, city)

    max_temperature = 0
    min_temperature = 100
    max_humidity = 0
    max_temp_date = ""
    max_humid_date = ""
    min_temp_date = ""

    Dir.foreach(city) do |city_data|
      next if city_data == '.' or city_data == '..'
      File.readlines("#{city}/" + city_data).each do |line|
        next if year != File.basename(city_data,".*").split("_").min
        data_line = line.split(',')

        max_temperature_data = Array.new
        min_temperature_data = Array.new
        max_humid_data = Array.new
        date = Array.new

        date.append(data_line[0])
        max_temperature_data.append(data_line[1].to_i)
        min_temperature_data.append(data_line[3].to_i)
        max_humid_data.append(data_line[7].to_i)

        max_temperature_data.each do |temperature|
          if temperature > max_temperature
            max_temperature = temperature
            max_temp_date_index =  max_temperature_data.find_index(temperature)
            max_temp_date = date[max_temp_date_index]

          end
        end

        min_temperature_data.each do |temperature|
          if temperature < min_temperature
            min_temperature = temperature
            min_temp_date_index =  min_temperature_data.find_index(temperature)
            min_temp_date = date[min_temp_date_index]
          end
        end

        max_humid_data.each do |humidity|
          if humidity > max_humidity
            max_humidity = humidity
            max_humid_date_index =  max_humid_data.find_index(humidity)
            max_humid_date = date[max_humid_date_index]

          end
        end

      end

    end

    puts "Highest: #{max_temperature}C on #{month(max_temp_date)} #{max_temp_date.split('-').last}"
    puts "Lowest: #{min_temperature}C on #{month(min_temp_date)} #{min_temp_date.split('-').last}"
    puts "Humid: #{max_humidity}% on #{month(max_humid_date)} #{max_humid_date.split('-').last}"

  end

  def WeatherMan.month_data(city)

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

  def WeatherMan.month_data_display(city, date)
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


  def WeatherMan.get_month(input)

    month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    return month[input.to_i - 1]

  end

  def WeatherMan.month(date)
    month_index = date.split('-').min
    if month_index == '1'
      month = "Jan"
    elsif month_index == '2'
      month = "Feb"
    elsif month_index == '3'
      month = "Mar"
    elsif month_index == '4'
      month = "Apr"
    elsif month_index == '5'
      month = "May"
    elsif month_index == '6'
      month = "Jun"
    elsif month_index == '7'
      month = "Jul"
    elsif month_index == '8'
      month = "Aug"
    elsif month_index == '9'
      month = "Sep"
    elsif month_index == '10'
      month = "Oct"
    elsif month_index == '11'
      month = "Nov"
    else
      month = "Dec"
    end
  end

end
WeatherMan.start
