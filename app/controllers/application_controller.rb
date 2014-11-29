class ApplicationController < ActionController::Base
  protect_from_forgery

  # Redirect the users to the appropriate place on login.
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_url
  end
end
