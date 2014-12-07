class ReviewsController < ApplicationController
  before_action :set_user_and_review, only: [:add]
  before_action :set_review, only: [:edit]
  layout 'reviews'

  def add
    @review = Review.create(user: @user, rating: @rating)
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to root, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_user_and_review
      @user = User.find_by_permalink(params[:permalink])
      @rating = params[:rating] if params[:rating]
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:comment)
    end

    def user_params
      params.require(:user).permit(:permalink)
    end
end
