class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_resource, :only => [:show, :update, :destroy]

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    unless @user == current_user
      @user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  private
  def get_resource
    @user = User.find(params[:id]) if params[:id]
  end
end