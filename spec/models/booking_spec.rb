# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  adults     :integer
#  children   :integer
#  start_date :date
#  end_date   :date
#  with_car   :boolean
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string(255)
#

require 'spec_helper'

describe Booking do

	before	do
		@booking = Booking.new(name: "Nicolas Mauchle", 
                     			 email: "nmauchle@gmail.com",
                     			 adults: 2,
                     			 children: 3,
                     			 start_date: Date.new(),
                     			 end_date: Date.new()+7,
                     			 with_car: :False,
                     			 note: "Eine kleine Notiz")
  	end

  subject { @booking }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:adults) }
  it { should respond_to(:children) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:with_car) }
  it { should respond_to(:note) }

  it { should be_valid }
end
