require 'spec_helper'

describe SuggestionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "Post 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

end
