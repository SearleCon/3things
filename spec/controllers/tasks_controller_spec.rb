require 'spec_helper'

describe TasksController do

  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user

    @task = FactoryGirl.create(:task, :user => @user)
    @status = FactoryGirl.create(:status, :name => 'Todo')
    @new_status = FactoryGirl.create(:status, :name => 'Doing')
    @valid_params =  @task.attributes
    @invalid_params =  FactoryGirl.build(:invalid_task, :user => @user).attributes
  end

  # This should return the minimal set of attributes required to create a valid
  # Task. As you add validations to Task, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :description => 'MyDescription', :title => 'Title', :status_id => @status.id, :user_id => @user.id }
  end

  describe "has a current_user" do
    it "has a current_user" do
      subject.current_user.should_not be_nil
    end
  end

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      get :index, {}
      assigns(:tasks).should eq([@task])
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      get :show, {:id => @task.to_param}
      assigns(:task).should eq(@task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      get :new, {}
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      get :edit, {:id => @task.to_param}
      assigns(:task).should eq(@task)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      it "creates a new Task" do
        expect {
          post :create, {:task => @valid_params}
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => @valid_params}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => @valid_params}
        response.should redirect_to(Task.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {task:  @invalid_params }
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {task: @invalid_params }
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        # Assuming there are no other tasks in the database, this
        # specifies that the Task created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :update, {:id => @task.to_param, :task => @valid_params}
      end

      it "assigns the requested task as @task" do
        put :update, {:id => @task.to_param, :task => @valid_params}
        assigns(:task).should eq(@task)
      end

      it "redirects to the task" do
        put :update, {:id => @task.to_param, :task => @valid_params}
        response.should redirect_to(@task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        put :update, {:id => @task.to_param, :task => @invalid_params }
        assigns(:task).should eq(@task)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @task.to_param, :task =>  @invalid_params}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      expect {
        delete :destroy, {:id => @task.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, {:id => @task.to_param}
      response.should redirect_to(tasks_url)
    end
  end

  describe "PUT moved" do

    it "located the requested @task" do
      put :moved, { :id => @task.id, :status => @new_status.name, :format => :js}
      assigns(:task).should eq(@task)
    end

    it "should render js" do
      put :moved, { :id => @task.id, :status => @new_status.name, :format => :js}
      response.content_type.should == Mime::JS
    end

    it "updates the requested task status" do
      put :moved, { :id => @task.id, :status => @new_status.name}, :format => :js
      @task.reload
      @task.status.should eq(@new_status)
    end

    it "should render moved.js.erb" do
      put :moved, { :id => @task.id, :status => @new_status.name}, :format => :js
      response.should render_template(:js => "moved.js")
    end
  end

  describe "DELETE remove_selected"do
    before(:each) do
      @tasks = [@task.id]
    end

    it "should render js" do
      delete :remove_selected, {:task_ids => @tasks, :format => :js }
      response.content_type.should == Mime::JS
    end

    it "deletes the requested tasks" do
      expect {
        delete :remove_selected, {:task_ids => @tasks, :format => :js }
      }.to change(Task, :count).by(-@tasks.size)
    end

    it "should render remove_selected.js.erb" do
      put :moved, { :id => @task.id, :status => @new_status.name}, :format => :js
      response.should render_template(:js => "remove_selected.js")
    end
  end

end
