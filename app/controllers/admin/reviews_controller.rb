class Admin::ReviewsController < ApplicationController
	# before_filter :authorize

	def index
	end

	def new
	end

	def create
	end

	def update
	end

	def edit
	end

  private
  # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:id)
    end
end
