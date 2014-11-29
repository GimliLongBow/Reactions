class Admin::ReviewsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@reviews = Review.by_last_updated.page(params[:page])
	end

	def show
	end

	def new
		@review = Review.new
	end

	def edit
	end

	def create
		@review = Review.new(review_params)

		if @review.save
			redirect_to admin_reviews_url, notice: 'Review was successfully created.'
		else
			render :new
		end
	end

	def update
		if @review.update(review_params)
			redirect_to admin_reviews_url, notice: 'Review was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@review.destroy
		redirect_to admin_reviews_url, notice: 'Review was successfully destroyed.'
	end

private
	def set_review
		@review = review.find(params[:id])
	end
	
	def review_params
		params.require(:review).permit(:rating, :comments, :user_id)
	end
end
