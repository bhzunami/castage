# encoding: utf-8

class StaticPagesController < ApplicationController

  def home
  	@images = []
  	@images << { url: 'Haus1.jpg', alt: 'IMAGE1'} 
  	@images << { url: 'Haus2.jpg', alt: 'IMAGE2'} 
    @images << { url: 'img_3.jpg', alt: 'IMAGE3'} 

    #Dir.new("app/assets/images/home").entries.each do |f| @home_pictures.push(f) if File.file?(File.absolute_path(f,d) ) end
  end

  def property_description
  	@images = []
  	@images << { url: 'Haus1.jpg', title: 'Haus', 
  				description: ' Gemütliches und gut eingerichtetes 4-Zimmer-Chalet an ruhiger Lage mit wunderbarer Aussicht ins Haslital.'} 
  	@images << { url: 'Haus2.jpg', alt: 'IMAGE2', title: 'Als Familie',
  				description: 'Mit bis zu 6 Schlafmöglichkeiten ist das Haus auch für eine Grossfamilie bestens geeignet.'} 
  	@images << { url: 'img_3.jpg', alt: 'IMAGE3', title: 'Romantische Abende',
  				description: 'Entspannen Sie sich vor einem knisternden, warmen Cheminee, in einer kuscheligen Stube.'} 
  end

  def foto_gallery
    @categories = Dir.glob("app/assets/images/gallery/*")
    @category_path = params[:category]
    if @category_path
      @gallery_images = Dir.glob("app/assets/images/gallery/#{@category_path}/*_tb*")
      render 'show_images'
    end
  end

  def show_images
  end
  
end
