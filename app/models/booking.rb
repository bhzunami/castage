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

# Validations
#----------------------------------------
	validates :name, presence: true, length: { maximum: 50}
  
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  validates :adults, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
  validates :children, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }

  validates :start_date, presence: true
  validate :check_start_date

  validates :end_date, presence: true
  validate :check_end_date

  validates :zeitspanne, range: { not_overlapping: Proc.new{ Booking.where(state: :accepted) }}

  def zeitspanne
    self.start_date..self.end_date
  end

  #State Machine
  state_machine :state, initial: :pending do
    event :accept do
      transition pending: :accepted
    end

    event :reject do
      transition pending: :rejected
    end

    event :archive do
      transition accepted: :archive
      transition rejected: :archive
    end

    state :accepted do
      # To be define
    end

    state :rejected do
      # To be define
    end

    state :pending do
      # To be define
    end
      
  end


  def accept_booking(booking)
    throw "Kein Anfrage" unless booking.instance_of? Booking
    self.transaction do
      booking.accept
    end
  end

  # Public Methos
  #----------------------------------------
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
