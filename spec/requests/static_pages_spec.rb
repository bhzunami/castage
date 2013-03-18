require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    
    it "should have the content 'Willkommen auf der Seite' " do
    	visit '/static_pages/home'
    	page.should have_content('Willkommen auf der Seite')
    end
  end
end
