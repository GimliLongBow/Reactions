require 'spec_helper'

RSpec.describe Admin::ReviewsController, :type => :controller do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

end
