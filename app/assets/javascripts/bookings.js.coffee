# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	months = { }
	months["Jan"] = '01'
	months['Feb'] = '02'
	months['Mär'] = '03'
	months['Apr'] = '04'
	months['Mai'] = '05'
	months['Jun'] = '06'
	months['Jul'] = '07'
	months['Aug'] = '08'
	months['Sep'] = '09'
	months['Okt'] = '10'
	months["Nov"] = '11'
	months['Dez'] = '12'

	$("#booking_start_date").datepicker dateFormat: "dd/mm/yy"
	$("#booking_end_date").datepicker dateFormat: "dd/mm/yy"

	#unless $("#booking_start_date").val() is ''
	#	start_date_as_array = $("#booking_start_date").val().split(" ")
	#	console.log(start_date_as_array)
	#	year = start_date_as_array[3]
	#	console.log(year)
	#	month = months[start_date_as_array[2]]
	#	console.log(month)
	#	day = start_date_as_array[1]
	#	console.log(day)
	#	start_date = new Date(year, month, day, null, null, null, null)
	#	$("#booking_start_date").val $.datepicker.formatDate("dd/mm/yy", start_date)

	unless $("#booking_end_date").val() is ''
		end_date_as_array = $("#booking_end_date").val().split(" ")
		year = end_date_as_array[2]
		month = months[end_date_as_array[1]]
		day = end_date_as_array[0]
		end_date = new Date(year, month, day, null, null, null, null)
		$("#booking_end_date").val $.datepicker.formatDate("dd/mm/yy", end_date)

