module BookingsHelper
	def content_type_options
    ['Ja', 'Nein']
  end

  def year_now
  	@date.year
  end

  def month_now
  	@date.month
  end

  def month_next
  	if @date.month == 12
  		month_next = 1
  	else
  		month_next = @date.month + 1
  	end
  end

  def year_next
		if @date.month == 12
  		year_next = @date.year + 1
  	else
  		year_next = @date.year
  	end
 	end

  def month_next_next
  	if @date.month == 11
  		month_next_next = 1
  	elsif @date.month == 12
  		month_next_next = 2
  	else
  		month_next = @date.month + 2
  	end
  end

  def year_next_next
		if @date.month >= 11
  		year_next_next = @date.year + 1
  	else
  		year_next_next = @date.year
  	end
 	end

end
