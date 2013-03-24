require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    # Any content on the website
    it { should have_content( 'This is a little bit bla bli blu for a subtitl' ) }
    it { should have_selector('title',
                  :text => full_title('') ) }
  end

  describe "Property Description page" do
    before { visit property_description_path }

  	it { should have_content( 'Objektbeschreibung' ) }
    it { should have_selector('title',
    							:text => full_title('Objektbeschreibung') ) }
  end

  describe "Reservation page" do
    before { visit reservation_path }
  	
  	it { should have_content( 'Reservation' ) }
    it { should have_selector('title',
    							:text => full_title('Reservation') ) }
  end
  
end
