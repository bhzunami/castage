class StaticPagesController < ApplicationController

  def home
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Home', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'} 
  end

  def property_description
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Haus', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'} 
  end

  def reservation
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Reservation', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'} 
  end
  
end
