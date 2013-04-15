# Be sure to restart your server when you modify this file.

RequestTracker::Application.config.session_store :cookie_store, key: '_request_tracker_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# RequestTracker::Application.config.session_store :active_record_store
