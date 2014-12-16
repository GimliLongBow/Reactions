class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Redirect the users to the appropriate place on login.
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_url
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || admin_path)
  end
end
