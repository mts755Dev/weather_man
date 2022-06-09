require_relative "year_data"
require_relative "month_data"
require_relative "month_data_display"
require_relative "extra_func"
module WeatherMan

  def WeatherMan.start

    input_array = ARGV
    tag = input_array[0]

    case tag

    when '-e'

      year = input_array[1]
      city = input_array[2].split('/').last
      YearData::year_data(year,city)

    when '-a'

      file_name = input_array[2].split('/').last
      city = input_array[2].split(' ').join
      a = city.slice! "/"
      MonthData::month_data(city)

    when '-c'

      month_num = input_array[1].split('/').last
      req_year = input_array[1].split('/').first
      req_month =  ExtraFunc::get_month(month_num)
      date = "#{req_month} #{req_year}"
      city = input_array[2].split(' ').join
      a = city.slice! "/"
      MonthDataDisplay::month_data_display(city,date)

    else

      exit

    end

  end

end
WeatherMan.start
