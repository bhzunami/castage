# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	return unless location.pathname.split("/")[1] is "bookings"
	months = { }
	months["Jan"] = '00'
	months['Feb'] = '01'
	months['Mär'] = '02'
	months['Apr'] = '03'
	months['Mai'] = '04'
	months['Jun'] = '05'
	months['Jul'] = '06'
	months['Aug'] = '07'
	months['Sep'] = '08'
	months['Okt'] = '09'
	months["Nov"] = '10'
	months['Dez'] = '11'

	$("#booking_start_date").datepicker dateFormat: "dd/mm/yy"
	$("#booking_end_date").datepicker dateFormat: "dd/mm/yy"

	unless $("#booking_start_date").val() is ''
		start_date_as_array = $("#booking_start_date").val().trim().split(" ")
		year = start_date_as_array[2]
		month = months[start_date_as_array[1]]
		day = start_date_as_array[0]
		start_date = new Date(year, month, day, null, null, null, null)
		$("#booking_start_date").val $.datepicker.formatDate("dd/mm/yy", start_date)

	unless $("#booking_end_date").val() is ''
		end_date_as_array = $("#booking_end_date").val().trim().split(" ")
		year = end_date_as_array[2]
		month = months[end_date_as_array[1]]
		day = end_date_as_array[0]
		end_date = new Date(year, month, day, null, null, null, null)
		$("#booking_end_date").val $.datepicker.formatDate("dd/mm/yy", end_date)

