class BookingsController < ApplicationController
	before_filter :signed_in_user, only: [:index, :show]

	def create
		setup
		@booking = Booking.new(params[:booking])
		if @booking.save
			@booking.new_booking
			flash[:success] = "Buchung erfolgreich"
			redirect_to new_booking_url
		else
			render 'new'
		end
	end

	def new
		@images = get_images
  	@booking = Booking.new
  	setup
  	
	end

	def index
		@bookings_new = Booking.with_state(:pending).paginate(:page => params[:page], :per_page => 10)
		@bookings_accepted = Booking.with_state(:accepted).paginate(:page => params[:page], :per_page => 10)
		@bookings_rejected = Booking.with_state(:rejected).paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@booking = Booking.find_by_id(params[:id])
		get_reserved_dates
	end

	def archived_bookings
		@bookings = Booking.with_state(:archive).paginate(:page => params[:page])
	end

	def accept
		booking = Booking.find(params[:booking_id])
		if booking.accept
			flash[:success] = "Anfrage von #{booking.name} wurde erfolgreich angenommen."
		else
			booking.errors.full_messages.each do |msg|
				flash[:error]= msg
			end
		end
		redirect_to bookings_path
	end

	def reject
		booking = Booking.find(params[:booking_id])
		if booking.update_attribute(:state, "rejected")
			flash[:success] = "Anfrage von #{booking.name} wurde erfolgreich abgelehnt."
		else
			booking.errors.full_messages.each do |msg|
				flash[:error]= msg
			end
		end
		redirect_to bookings_path
	end

	def archive
		booking = Booking.find(params[:booking_id])
		if booking.accepted? || booking.rejected?
			if booking.update_attribute(:state, "archive")
				flash[:success] = "Anfrage von #{booking.name} wurde erfolgreich archiviert."
			else
				booking.errors.full_messages.each do |msg|
					flash[:error]= msg
				end		
			end
			redirect_to bookings_path
		end
	end

#-------------------------------
	private

	def setup
		get_reserved_dates
  	@date = params[:month] ? Date.parse(params[:month]) : Date.today
  	if(params.has_key?(:month) )
  		cookies[:date_changer] = true
  	else
  		cookies.delete(:date_changer)
  	end
	end

		def get_images
			@images = []
  		@images << { url: 'Haus1.jpg', alt: 'IMAGE1', title: 'Reservation', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  		@images << { url: 'Haus2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  		@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'}
		end

		def get_reserved_dates
			@dates_test = []
			bookings = Booking.with_state(:accepted)
			bookings.each do |b|
				
				days = (b.end_date - b.start_date).to_i
				days.times do |i|
					@dates_test << b.start_date + i
				end
			end
			return @dates_test

  	end

end
