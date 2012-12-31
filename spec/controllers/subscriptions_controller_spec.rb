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
    { :customer_paypal_id => '1234' }
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

  describe "with invalid params" do
    describe "with invalid params" do
      it "assigns a newly created but unsaved subscription as @subscription" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create,{:subscription => { :customer_paypal_id => nil}, :plan_id => @plan.to_param}
        assigns(:subscription).should be_a_new(Subscription)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:subscription => { :customer_paypal_id => nil}, :plan_id => @plan.to_param}
        response.should render_template("new")
      end
    end
  end


end
