class ReviewsController < ApplicationController

  def new
  end

  def create
  end

  private
  # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:rating)
    end
end
