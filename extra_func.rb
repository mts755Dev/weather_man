module ExtraFunc

  def ExtraFunc.get_month(input)

    month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    return month[input.to_i - 1]

  end

  def ExtraFunc.month(date)
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
