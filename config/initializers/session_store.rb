# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jqgrid-test_session',
  :secret      => '1a43f3e09ebadaa98c35d988724a29072927e28699ce64eb6e0ca8f7cc2dbc7c1e5a83d41e364e9016d4bb6fb5eeb245416ea351a54ae19169d4c2bd10712697'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
