require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    
    it "should have the content 'Willkommen auf der Seite' " do
    	visit root_path
    	page.should have_content( 'Ferienhaus vor Weissenfluh' )
    end

    it "should have the correct title" do
    	visit root_path
    	page.should have_selector('title',
    							:text => "Ferienhaus vor Weissenfluh | Home")
    end

  end

  describe "Property Description page" do

  	it "should have the content 'Objektbeschreibung' " do
  		visit property_description_path
  		page.should have_content( 'Objektbeschreibung' )
  	end

  	it "should have the correct title" do
    	visit property_description_path
    	page.should have_selector('title',
    							:text => "Ferienhaus vor Weissenfluh | Objektbeschreibung")
    end

  end

  describe "Reservation page" do

  	it "should have the content 'Reservation' " do
  		visit reservation_path
  		page.should have_content( 'Reservation' )
  	end

  	it "should have the correct title" do
    	visit reservation_path
    	page.should have_selector('title',
    							:text => "Ferienhaus vor Weissenfluh | Reservation")
    end

  end
end
