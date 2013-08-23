module BookingsHelper

  def booking_show_calculateDate(start_date, count)
    if count == 0
      if start_date.day >= 12
        start_date
      else
        start_date - 1.month
      end
    else # count = 1
      if start_date.day >= 12
        start_date + 1.month
      else
        start_date
      end
    end
  end

  def booking_new_calculateDate(date, count)
    date + count.month
  end

  def booking_new_year(date)
    if (date.month + 2) > 12
      "#{date.year} / #{(date + 1.year).year}"
    else
      date.year
    end
  end

  def booking_show_newDates(booking)
    new_reservationDates = []
    days = (booking.end_date - booking.start_date).to_i
    days.times do |i|
      new_reservationDates << booking.start_date + i
    end
    new_reservationDates
  end
end
