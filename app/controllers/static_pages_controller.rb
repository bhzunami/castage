# encoding: utf-8

class StaticPagesController < ApplicationController

  def home
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Willkommen', 
  				description: "Willkommen auf der Weissenfluh. Geniessen sie Ihre Ferien in Ruhe in einem gemütlichen Chalet mitten im Haslitall mit einer grandiosen Aussicht auf den See."} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Natur erleben',
  				description: 'Geniessen sie die Natur und die freie Landluft.'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'} 

    @home_pictures = []
    #Dir.new("app/assets/images/home").entries.each do |f| @home_pictures.push(f) if File.file?(File.absolute_path(f,d) ) end
  end

  def property_description
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Haus', 
  				description: ' Gemuütliches und gut eingerichtetes 4-Zimmer-Chalet an ruhiger Lage mit wunderbarer Aussicht ins Haslital.'} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Als Famile',
  				description: 'Geniessen Sie die Zeit als Familie. Mit bis zu 6 Schlafmöglichkeiten ist das Haus auch fuer eine Grossfamilie bestens geeignet.'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Romantische Abende',
  				description: 'Entspannen Sie sich vor einem knisternden, warmen Chminee, in einer kuscheligen Stube.'} 
  end

  def reservation
  	@images = []
  	@images << { url: 'img_1.jpg', alt: 'IMAGE1', title: 'Reservation', description: 'More Bla bli blu for the description of the picutre. Should be a little bit more bla bli blu'} 
  	@images << { url: 'img_2.jpg', alt: 'IMAGE2', title: 'Title Bild 2'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Title Bild 3'} 
  end
  
end
