class BookingsController < ApplicationController

	def create
		@booking = Booking.new(params[:booking])
		if @booking.save
			flash[:success] = "Buchung erfolgreich"
			redirect_to new_booking_url
		else
			#@images = get_images
			render 'new'
		end
	end

	def new
		@images = get_images
  	@booking = Booking.new
	end

	private

		def get_images
			@images = []
  		@images << { url: 'Haus1.jpg', alt: 'IMAGE1', title: 'Reservation', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  		@images << { url: 'Haus2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  		@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'}
		end
end
