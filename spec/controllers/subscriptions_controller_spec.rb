require 'spec_helper'


describe SubscriptionsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @plan = FactoryGirl.create(:plan, active: true)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Subscription. As you add validations to Subscription, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { }
  end

  describe "GET new" do
    it "assigns a new subscription as @subscription" do
      get :new, { :plan_id => @plan.id}
      assigns(:subscription).should be_a_new(Subscription)
    end
  end


  describe "POST create" do

    describe "with valid params" do
      it "creates a new Subscription" do
        expect {
          post :create, {:subscription => valid_attributes, :plan_id => @plan.id}
        }.to change(Subscription, :count).by(1)
      end

      it "assigns a newly created subscription as @subscription" do
        post :create, {:subscription => valid_attributes, :plan_id => @plan.id}
        assigns(:subscription).should be_a(Subscription)
        assigns(:subscription).should be_persisted
      end

      it "redirects to the created subscription" do
        post :create, {:subscription => valid_attributes, :plan_id => @plan.id}
        response.should redirect_to(root_url)
      end
    end

  end

end
