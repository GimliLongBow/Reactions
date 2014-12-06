class WelcomeController < ApplicationController
  before_action :authenticate_user!, :only => [:admin]
  layout 'admin'

  def index
  end

  def admin
  end

end
