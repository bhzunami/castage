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
  #validates_presence_of :start_date

  validates :end_date, presence: true
  validate :check_end_date


  #scope :accepted, where(:state => "accepted")
  #validates :start_date, :end_date, overlap: { scope: Proc.new{ Booking.where(state: :accepted) }}

  validates :zeitspanne, range: { not_overlapping: Proc.new{ Booking.where(state: :accepted) }}, if: (:start_date? && :end_date?)

# The zeitspanne have to be -1 because it is possible that the end_date can also be a start date
  def zeitspanne
    self.start_date..self.end_date-1 unless self.start_date.nil? || self.end_date.nil?
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
      #BookingMailer.booking_confirmation(self).deliver
    end
      
  end

  def new_booking
    send_booking_confirmation
    send_booking_notification
  end


  def send_booking_confirmation
    BookingMailer.booking_confirmation(self).deliver
  end

  def send_booking_notification
    BookingMailer.booking_notification(self).deliver
  end


  # Public Methos
  #----------------------------------------
  def check_start_date
    if self.start_date != nil && self.start_date.past?
      errors.add(:start_date, 'muss heute sein oder in der Zukunft liegen')
    end
  end

  def check_end_date
    # Family Knöll does not have to book 7 days
    if self.email == 'karinknoell@yahoo.de' && self.name == 'Familie Knöll'
      return true
    end
    if self.end_date != nil && self.start_date != nil
      errors.add(:end_date, 'muss mind 7 Nächte grösser sein als das Startdatum') unless self.start_date < self.end_date && self.start_date + 7 <= self.end_date
    end
  end

end
