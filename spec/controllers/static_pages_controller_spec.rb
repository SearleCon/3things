require 'spec_helper'

describe StaticPagesController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      response.should be_success
    end
  end

  describe "GET 'privacy_policy'" do
    it "returns http success" do
      get 'privacy_policy'
      response.should be_success
    end
  end

  describe "GET 'terms_and_conditions'" do
    it "returns http success" do
      get 'terms_and_conditions'
      response.should be_success
    end
  end

end
