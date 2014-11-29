class WelcomeController < ApplicationController
  before_filter :authorize, :only => [:admin]

  def index
  end

  def admin
  end

end
