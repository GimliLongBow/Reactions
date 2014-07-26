class FeedbackController < ApplicationController
	def new
		
	end

  private
  # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:id)
    end
end
