class BookingMailer < ActionMailer::Base
  default from: "no-reply@chalet-weissenfluh.ch"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(booking)
    @booking = booking
    mail to: booking.email, subject: "Bunchungsanfrage"
  end

  def booking_notification(booking)
    @booking = booking
    mail to: "karinknoell@yahoo.de", subject: "Neue Buchungsanfrage"
  end
end
