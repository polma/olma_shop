# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OlmaShop::Application.initialize!


config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => 'smsdispatcher.android@gmail.com',
  :password             => 'dispatch!@#',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }
