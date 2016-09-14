# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_lacavedesmoines_session'

# http://stackoverflow.com/questions/9473808/cookie-overflow-in-rails-application
Rails.application.config.session_store :active_record_store, :key => '_my_app_session'
