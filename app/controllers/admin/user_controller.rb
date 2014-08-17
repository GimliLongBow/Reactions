class Admin::UserController < ApplicationController

  private
  # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id)
    end
end
