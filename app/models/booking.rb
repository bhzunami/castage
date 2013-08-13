# == Schema Information
#
# Table name: bookings
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  email                   :string(255)
#  adults                  :integer
#  children                :integer
#  start_date              :date
#  end_date                :date
#  with_car                :boolean
#  note                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  validates_acceptance_of :boolean
#

class Booking < ActiveRecord::Base
  attr_accessible :adults, 
  								:children, 
  								:email, 
  								:end_date, 
  								:name, 
  								:note, 
  								:start_date, 
  								:with_car,
                  :terms_of_service


	validates :name, presence: true, length: { maximum: 50}
  
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  validates :adults, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
  validates :children, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }

  validates :start_date, presence: true
  validate :check_start_date

  validates :end_date, presence: true
  validate :check_end_date



def check_start_date
  if self.start_date != nil && self.start_date.past?
      errors.add(:start_date, 'muss heute sein oder in der Zukunft liegen')
  end
end

def check_end_date
  if self.end_date != nil
    errors.add(:end_date, 'muss grösser sein als Startdatum') unless self.start_date < self.end_date
  end
end






end
