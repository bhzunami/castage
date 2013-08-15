# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Castage::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'app15258626@heroku.com',
  :password => 'rukgjw9w',
  :domain => 'castage.heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}