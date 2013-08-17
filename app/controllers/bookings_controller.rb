class BookingsController < ApplicationController
	before_filter :signed_in_user, only: [:index, :show]

	def create
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
	end

	def index
		@bookings_new = Booking.with_state(:pending).paginate(:page => params[:page], :per_page => 10)
		@bookings_accepted = Booking.with_state(:accepted).paginate(:page => params[:page], :per_page => 10)
		@bookings_rejected = Booking.with_state(:rejected).paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@booking = Booking.find_by_id(params[:id])
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

		def get_images
			@images = []
  		@images << { url: 'Haus1.jpg', alt: 'IMAGE1', title: 'Reservation', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  		@images << { url: 'Haus2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  		@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'}
		end

end
