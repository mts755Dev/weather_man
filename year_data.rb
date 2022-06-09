require_relative "extra_func"

module YearData

  def YearData.year_data(year, city)

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

    puts "Highest: #{max_temperature}C on #{ExtraFunc::month(max_temp_date)} #{max_temp_date.split('-').last}"
    puts "Lowest: #{min_temperature}C on #{ExtraFunc::month(min_temp_date)} #{min_temp_date.split('-').last}"
    puts "Humid: #{max_humidity}% on #{ExtraFunc::month(max_humid_date)} #{max_humid_date.split('-').last}"

  end

end
